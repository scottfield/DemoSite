/*
 * Copyright 2008-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cdfamedy.controller.checkout;

import com.cdfamedy.controller.form.CustomShippingInfoForm;
import com.cdfamedy.core.service.ShopService;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.*;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafShippingInfoController;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ShippingInfoController extends BroadleafShippingInfoController {
    @Resource(name = "shopService")
    private ShopService shopService;
    @Resource(name = "blAddressService")
    private AddressService addressService;

    /**
     * 填写提货信息页面
     *
     * @param request
     * @param response
     * @param model
     * @return
     * @throws PricingException
     */
    @RequestMapping(value = "/checkout/singleship", method = RequestMethod.GET)
    public String convertToSingleship(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return "checkout/addressForm";
    }

    /**
     * 保存收货地址
     *
     * @param request
     * @param response
     * @param model
     * @param orderInfoForm
     * @param billingForm
     * @param giftCardInfoForm
     * @param shippingForm
     * @param result
     * @return
     * @throws PricingException
     * @throws ServiceException
     */
    @RequestMapping(value = "/checkout/singleship", method = RequestMethod.POST)
    public String saveSingleShip(HttpServletRequest request, HttpServletResponse response, Model model,
                                 @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
                                 @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
                                 @ModelAttribute("giftCardInfoForm") GiftCardInfoForm giftCardInfoForm,
                                 @ModelAttribute("shippingInfoForm") CustomShippingInfoForm shippingForm,
                                 BindingResult result)
            throws PricingException, ServiceException {
        Address address = shippingForm.getAddress();
        address.setAddressLine1("default");
        address.setPostalCode("default");
        address.setLastName("default");
        address.setCity("default");
       /*
        CountryImpl country = new CountryImpl();
        country.setName("default");
        address.setCountry(country);
        State state = new StateImpl();
        state.setName("default");
        address.setState(state);*/
        Address savedAddress = addressService.saveAddress(address);
        return "redirect:/checkout/singleship";
    }

    @RequestMapping(value = "/checkout/multiship", method = RequestMethod.GET)
    public String showMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
                                @ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm,
                                BindingResult result) throws PricingException {
        return super.showMultiship(request, response, model);
    }

    @RequestMapping(value = "/checkout/multiship", method = RequestMethod.POST)
    public String saveMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
                                @ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm,
                                BindingResult result) throws PricingException, ServiceException {
        return super.saveMultiship(request, response, model, orderMultishipOptionForm, result);
    }

    @RequestMapping(value = "/checkout/add-address", method = RequestMethod.GET)
    public String showMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
                                          @ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) {
        return super.showMultishipAddAddress(request, response, model);
    }

    @RequestMapping(value = "/checkout/add-address", method = RequestMethod.POST)
    public String saveMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
                                          @ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) throws ServiceException {
        return super.saveMultishipAddAddress(request, response, model, addressForm, result);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
    }

}
