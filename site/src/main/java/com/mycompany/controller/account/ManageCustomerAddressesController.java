/*
 * Copyright 2008-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.account;

import com.mycompany.controller.form.CustomCustomerAddressForm;
import com.mycompany.controller.form.validator.CustomCustomerAddressFormValidator;
import com.mycompany.sample.core.WeiXinConstants;
import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.service.WeixinService;
import com.mycompany.sample.util.CommonUtils;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafManageCustomerAddressesController;
import org.broadleafcommerce.profile.core.domain.*;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.CustomerAddressService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/account/addresses")
public class ManageCustomerAddressesController extends BroadleafManageCustomerAddressesController {
    @Resource(name = "shopService")
    private ShopService shopService;
    @Resource(name = "blAddressService")
    private AddressService addressService;

    @Resource(name = "blCustomerAddressService")
    private CustomerAddressService customerAddressService;
    @Resource
    private WeixinService weixinService;
    @Resource
    private CountryService countryService;

    public static final String FOLLOWED_ADDRESS_NAME = "关注门店";
    public static final String PICKUP_ADDRESS_NAME = "收货地址";
    private static final String referer = "http://weixin.cplotus.com/min_store/store.aspx";
    private Validator addressFormValidator = new CustomCustomerAddressFormValidator();

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
    }

    @ModelAttribute("states")
    protected List<State> populateStates() {
        return super.populateStates();
    }

    @ModelAttribute("countries")
    protected List<Country> populateCountries() {
        return super.populateCountries();
    }

    @ModelAttribute("customerAddresses")
    protected List<CustomerAddress> populateCustomerAddresses() {
//        return super.populateCustomerAddresses();
        return null;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String viewCustomerAddresses(HttpServletRequest request, @ModelAttribute("customerAddressForm") CustomCustomerAddressForm form) {
        String activeFiveCard = request.getParameter("activeFiveCard");
        if (Objects.nonNull(activeFiveCard)) {
            request.getSession().setAttribute("activeFiveCard", true);
            return "fivecard/active_form";
        } else {
            CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
            CustomAddress pickupAddress = customer.getPickupAddress();
            if (Objects.nonNull(pickupAddress)) {
                form.setAddress(pickupAddress);
            }
            return "account/addressForm";
        }
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addCustomerAddress(HttpServletRequest request, Model model, @ModelAttribute("customerAddressForm") CustomCustomerAddressForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
        addressFormValidator.validate(form, result);
        if (result.hasErrors()) {
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError error : allErrors) {
                model.addAttribute(error.getCode(), error.getDefaultMessage());

            }
            return "account/addressForm";
        }
        CustomAddressImpl address = (CustomAddressImpl) form.getAddress();
        //set some default value to bypass form validation
        address.setAddressLine1("default");
        address.setPostalCode("default");
        address.setLastName("default");
        address.setCity("default");
//        super.addCustomerAddress(request, model, form, result, redirectAttributes);
        //update pickup address
        if (Objects.nonNull(address.getId())) {
            CustomAddressImpl oldAddress = (CustomAddressImpl) addressService.readAddressById(address.getId());
            oldAddress.setFirstName(address.getFirstName());
            Phone phonePrimary = oldAddress.getPhonePrimary();
            if (Objects.isNull(phonePrimary)) {
                phonePrimary = new PhoneImpl();
                oldAddress.setPhonePrimary(phonePrimary);
            }
            phonePrimary.setPhoneNumber(address.getPhonePrimary().getPhoneNumber());
            oldAddress.setShop(address.getShop());
            addressService.saveAddress(oldAddress);
        } else {//add a new address
            Country country = countryService.findCountryByAbbreviation("CA");
            address.setCountry(country);
            Address savedAddress = addressService.saveAddress(address);
            CustomerAddress customerAddress = customerAddressService.create();
            customerAddress.setAddress(savedAddress);
            customerAddress.setAddressName(PICKUP_ADDRESS_NAME);
            customerAddress.setCustomer(CustomerState.getCustomer());
            customerAddressService.saveCustomerAddress(customerAddress);
        }
        //如果是激活B类五折卡则跳转到激活链接
        HttpSession session = request.getSession();
        if (Objects.nonNull(session.getAttribute("activeFiveCard"))) {
            return "redirect:/fiveCard/activate";
        }

        return "redirect:/checkout";
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.GET)
    public String viewCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId) {
        return super.viewCustomerAddress(request, model, customerAddressId);
    }

    /**
     * 修改收货地址
     *
     * @param request
     * @param model
     * @param customerAddressId
     * @param form
     * @param result
     * @param redirectAttributes
     * @return
     * @throws ServiceException
     */
    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST)
    public String updateCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, @ModelAttribute("customerAddressForm") CustomCustomerAddressForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
        return super.updateCustomerAddress(request, model, customerAddressId, form, result, redirectAttributes);
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST, params = "removeAddress=Remove")
    public String removeCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, RedirectAttributes redirectAttributes) {
        return super.removeCustomerAddress(request, model, customerAddressId, redirectAttributes);
    }

    @RequestMapping("/followShop")
    public String followShop(HttpServletRequest request) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        String url = request.getRequestURL().toString();
        String openId = customer.getUsername();
        String src = url + "/callBack?openid=" + openId;
        src = CommonUtils.encodeUrl(src);
        String queryStr = "app_key=" + WeiXinConstants.APP_KEY + "&openid=" + openId + "&src=" + src;
        return "redirect:http://weixin.cplotus.com/min_store/store.aspx?" + queryStr;
    }

    @RequestMapping("/followShop/callBack")
    public String followShopCallBack(HttpServletRequest request, String openid) {
        String referrer = request.getHeader("Referer");

        //关注门店成功,添加关注门店地址
        if (Objects.nonNull(openid) && Objects.nonNull(referrer) && (referrer.contains(ManageCustomerAddressesController.referer) || referrer.contains("/fiveCard/activate"))) {
            Map<String, Object> vipInfo = weixinService.getVipInfo(openid);
            //模拟数据
//            Map<String, Object> vipInfo = new HashMap<>();
//            vipInfo.put("unit_code", "097");
//            vipInfo.put("unit_name", "乐从店");

            Shop shop = shopService.readShopByCode((String) vipInfo.get("unit_code"));
            //检测关注门店是否在活动范围
            if (Objects.isNull(shop)) {
                return "redirect:/fiveCard/activate";
            }

            CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
            CustomAddress followedShopAddress = customer.getFollowedShopAddress();
            if (Objects.nonNull(followedShopAddress)) {
                followedShopAddress.setShop(shop);
                addressService.saveAddress(followedShopAddress);
                return "redirect:/fiveCard/activate";
            }

            //添加关注门店地址
            CustomAddress address = new CustomAddressImpl();
            address.setAddressLine1("default");
            address.setPostalCode("default");
            address.setLastName("default");
            address.setCity("default");
            address.setFirstName("none");
            Phone phone = new PhoneImpl();
            phone.setPhoneNumber("none");
            address.setPhonePrimary(phone);

            address.setShop(shop);
            Address savedAddress = addressService.saveAddress(address);

            CustomerAddress customerAddress = customerAddressService.create();
            customerAddress.setAddress(savedAddress);
            customerAddress.setAddressName(FOLLOWED_ADDRESS_NAME);
            customerAddress.setCustomer(customer);
            customerAddressService.saveCustomerAddress(customerAddress);
        }
        return "redirect:/fiveCard/activate";
    }

}
