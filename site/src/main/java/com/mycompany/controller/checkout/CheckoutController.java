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

package com.mycompany.controller.checkout;

import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Promotion;
import com.mycompany.sample.core.catalog.domain.Shop;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.payment.PaymentType;
import org.broadleafcommerce.common.vendor.service.exception.PaymentException;
import org.broadleafcommerce.core.checkout.service.exception.CheckoutException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.CustomerCreditInfoForm;
import org.broadleafcommerce.core.web.checkout.model.GiftCardInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderInfoForm;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.broadleafcommerce.core.web.order.CartState;
import org.broadleafcommerce.core.workflow.Activity;
import org.broadleafcommerce.core.workflow.ProcessContext;
import org.broadleafcommerce.core.workflow.Processor;
import org.broadleafcommerce.profile.core.domain.Country;
import org.broadleafcommerce.profile.core.domain.Phone;
import org.broadleafcommerce.profile.core.domain.PhoneImpl;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class CheckoutController extends BroadleafCheckoutController {
    private static final Log LOG = LogFactory.getLog(CheckoutController.class);
    @Resource(name = "blCheckoutWorkflow")
    private Processor checkoutWorkflow;
    @Resource(name = "blValidateProductOptionsActivity")
    private Activity blValidateProductOptionsActivity;
    @Resource(name = "blCompleteOrderActivity")
    private Activity blCompleteOrderActivity;
    @Resource(name = "blDecrementInventoryActivity")
    private Activity blDecrementInventoryActivity;
    @Resource(name = "incrementProductSalesActivity")
    private Activity incrementProductSalesActivity;
    @Resource(name = "changeOrderStatusToUnpaidActivity")
    private Activity changeOrderStatusToUnpaidActivity;
    @Resource
    private AddressService addressService;
    @Resource
    private CountryService countryService;

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkoutPage(HttpServletRequest request, HttpServletResponse response, Model model,
                               @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
                               @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
                               @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
                               @ModelAttribute("giftCardInfoForm") GiftCardInfoForm giftCardInfoForm,
                               @ModelAttribute("customerCreditInfoForm") CustomerCreditInfoForm customerCreditInfoForm,
                               RedirectAttributes redirectAttributes) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomAddress pickupAddress = customer.getPickupAddress();
        model.addAttribute("pickupAddress", pickupAddress);
        return checkoutView;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String checkout(HttpServletRequest request, HttpServletResponse response, Model model,
                           @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
                           @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
                           @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
                           @ModelAttribute("giftCardInfoForm") GiftCardInfoForm giftCardInfoForm,
                           @ModelAttribute("customerCreditInfoForm") CustomerCreditInfoForm customerCreditInfoForm,
                           RedirectAttributes redirectAttributes) {
        Object promotion = request.getAttribute("promotion");
        if (promotion instanceof Promotion) {
            Promotion currentPromotion = (Promotion) promotion;
            int status = currentPromotion.getStatus();
            if (status != Promotion.IN_PROCESS) {
                model.addAttribute("errorMsg", "活动已结束!");
                return checkoutView;
            }

        }

        CustomOrder cart = (CustomOrder) CartState.getCart();
        LOG.warn("开始提交订单,订单ID:" + cart.getId() + ",订单状态:" + cart.getStatus().getType());
        try {
            CustomCustomer customer = (CustomCustomer) cart.getCustomer();
            CustomAddress pickupAddress = customer.getPickupAddress();
            model.addAttribute("pickupAddress", pickupAddress);
            if (Objects.isNull(pickupAddress) || Objects.isNull(pickupAddress.getPhonePrimary()) || StringUtils.isBlank(pickupAddress.getFirstName())) {
                model.addAttribute("errorMsg", "请完善收货地址");
                return checkoutView;
            }
            LOG.warn("开保存收货地址信息");
            //创建订单收货地址
            CustomAddress orderAddress = new CustomAddressImpl();
            orderAddress.setAddressLine1("default");
            orderAddress.setPostalCode("default");
            orderAddress.setLastName("default");
            orderAddress.setCity("default");
            Country country = countryService.findCountryByAbbreviation("CA");
            orderAddress.setCountry(country);
            //提货门店
            Shop shop = pickupAddress.getShop();
            orderAddress.setShop(shop);
            //提货人姓名
            orderAddress.setFirstName(pickupAddress.getFirstName());
            //保存电话
            Phone phonePrimary = pickupAddress.getPhonePrimary();
            Phone phone = new PhoneImpl();
            phone.setPhoneNumber(phonePrimary.getPhoneNumber());
            orderAddress.setPhonePrimary(phone);
            orderAddress = (CustomAddress) addressService.saveAddress(orderAddress);
            LOG.warn("收货地址信息保存完毕");
            cart.setAddress(orderAddress);
            checkoutService.performCheckout(cart);
            LOG.warn("提交订单成功,订单号:" + cart.getOrderNumber() + ",订单状态:" + cart.getStatus().getType());
        } catch (CheckoutException e) {
            LOG.error("下单失败", e);
            model.addAttribute("errorMsg", "下单失败!");
            return checkoutView;
        }
        return "redirect:/wechatpay/index/pay?orderId=" + cart.getId();
    }

    public String updateOrder() {
        return null;
    }

    @RequestMapping(value = "/checkout/savedetails", method = RequestMethod.POST)
    public String saveGlobalOrderDetails(HttpServletRequest request, Model model,
                                         @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
                                         @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
                                         @ModelAttribute("giftCardInfoForm") GiftCardInfoForm giftCardInfoForm,
                                         @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm, BindingResult result) throws ServiceException {
        return super.saveGlobalOrderDetails(request, model, orderInfoForm, result);
    }

    @RequestMapping(value = "/checkout/complete", method = RequestMethod.POST)
    public String processCompleteCheckoutOrderFinalized(RedirectAttributes redirectAttributes) throws PaymentException {
        return super.processCompleteCheckoutOrderFinalized(redirectAttributes);
    }

    @RequestMapping(value = "/checkout/cod/complete", method = RequestMethod.POST)
    public String processPassthroughCheckout(RedirectAttributes redirectAttributes)
            throws PaymentException, PricingException {
        return super.processPassthroughCheckout(redirectAttributes, PaymentType.COD);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
    }

    /**
     * 重写checkout工作流
     */
    @PostConstruct
    private void init() {
        List<Activity<ProcessContext<?>>> activities = new ArrayList<>();
        activities.add(blValidateProductOptionsActivity);
        activities.add(blDecrementInventoryActivity);
        activities.add(incrementProductSalesActivity);
        activities.add(blCompleteOrderActivity);
        activities.add(changeOrderStatusToUnpaidActivity);
        checkoutWorkflow.setActivities(activities);
    }

}
