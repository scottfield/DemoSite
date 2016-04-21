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
import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.service.ShopService;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafManageCustomerAddressesController;
import org.broadleafcommerce.profile.core.domain.*;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.broadleafcommerce.profile.core.service.CustomerAddressService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/account/addresses")
public class ManageCustomerAddressesController extends BroadleafManageCustomerAddressesController {
    @Resource(name = "shopService")
    private ShopService shopService;
    @Resource(name = "blAddressService")
    private AddressService addressService;

    @Resource(name = "blCustomerAddressService")
    private CustomerAddressService customerAddressService;

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
    public String viewCustomerAddresses(HttpServletRequest request, Model model) {
        Customer customer = CustomerState.getCustomer();
        //将关注名店设置为默认收货地址
        List<CustomerAddress> addressList = customer.getCustomerAddresses();
        if (Objects.nonNull(addressList) && addressList.size() > 0) {
            CustomerAddress customerAddress = addressList.get(0);
            CustomAddress address = (CustomAddress) customerAddress.getAddress();
            Shop shop = address.getShop();
            model.addAttribute("defaultShop", shop);
        }
        //获取门店列表
        Set<Shop> shops = shopService.getAllShop();
        Map<String, Set<Shop>> shopMap = new HashMap<>();
        for (Shop shop : shops) {
            String province = shop.getProvince();
            if (!shopMap.containsKey(province)) {
                Set<Shop> set = new HashSet<>();
                shopMap.put(province, set);
                set.add(shop);
            } else {
                shopMap.get(province).add(shop);
            }
        }
        model.addAttribute("areas", shopMap);
        return "account/addressForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addCustomerAddress(HttpServletRequest request, Model model, @ModelAttribute("customerAddressForm") CustomCustomerAddressForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
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
            oldAddress.getPhonePrimary().setPhoneNumber(address.getPhonePrimary().getPhoneNumber());
            oldAddress.setShop(address.getShop());
            addressService.saveAddress(oldAddress);
        } else {//add a new address
            Address savedAddress = addressService.saveAddress(address);
            CustomerAddress customerAddress = customerAddressService.create();
            customerAddress.setAddress(savedAddress);
            customerAddress.setAddressName("收货地址");
            customerAddress.setCustomer(CustomerState.getCustomer());
            customerAddressService.saveCustomerAddress(customerAddress);
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


}
