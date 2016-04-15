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
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.service.ShopService;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafManageCustomerAddressesController;
import org.broadleafcommerce.core.web.controller.account.CustomerAddressForm;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.Country;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.domain.State;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        return super.populateCustomerAddresses();
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewCustomerAddresses(HttpServletRequest request, Model model) {
        Set<Shop> shops = shopService.getAllShop();
        Map<String, Set<Shop>> shopmap = new HashMap<>();
        for (Shop shop : shops) {
            String area = shop.getArea();
            if (!shopmap.containsKey(area)) {
                Set<Shop> set = new HashSet<>();
                shopmap.put(area, set);
                set.add(shop);
            } else {
                shopmap.get(area).add(shop);
            }
        }
        model.addAttribute("areas", shopmap);
        return "account/addressForm";
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String addCustomerAddress(HttpServletRequest request, Model model, @ModelAttribute("customerAddressForm") CustomCustomerAddressForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
        Address address = form.getAddress();
        address.setAddressLine1("default");
        address.setPostalCode("default");
        address.setLastName("default");
        address.setCity("default");
        Address savedAddress = addressService.saveAddress(address);
        return "redirect:/account/addresses";
    }
    
    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.GET)
    public String viewCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId) {
        return super.viewCustomerAddress(request, model, customerAddressId);
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST)
    public String updateCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, @ModelAttribute("customerAddressForm") CustomerAddressForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
        return super.updateCustomerAddress(request, model, customerAddressId, form, result, redirectAttributes);
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST, params="removeAddress=Remove")
    public String removeCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, RedirectAttributes redirectAttributes) {
        return super.removeCustomerAddress(request, model, customerAddressId, redirectAttributes);
    }
    
    
}
