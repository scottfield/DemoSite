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

package com.mycompany.controller.cart;


import com.mycompany.worklow.cart.ExceededMaxPurchaseQuantityLimitException;
import com.mycompany.worklow.cart.FiveCardUnlockException;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.inventory.service.InventoryUnavailableException;
import org.broadleafcommerce.core.order.service.exception.AddToCartException;
import org.broadleafcommerce.core.order.service.exception.ProductOptionValidationException;
import org.broadleafcommerce.core.order.service.exception.RemoveFromCartException;
import org.broadleafcommerce.core.order.service.exception.RequiredAttributeNotProvidedException;
import org.broadleafcommerce.core.order.service.exception.UpdateCartException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.controller.cart.BroadleafCartController;
import org.broadleafcommerce.core.web.order.CartState;
import org.broadleafcommerce.core.web.order.model.AddToCartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/cart")
public class CartController extends BroadleafCartController {

    @Override
    @RequestMapping("")
    public String cart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return super.cart(request, response, model);
    }

    /**
     * 添加商品到购物车
     *
     * @param request
     * @param response
     * @param model
     * @param addToCartItem
     * @return
     * @throws IOException
     * @throws PricingException
     * @throws AddToCartException
     */
    @RequestMapping(value = "/add", produces = "application/json")
    public
    @ResponseBody
    Map<String, Object> addJson(HttpServletRequest request, HttpServletResponse response, Model model,
                                @ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, AddToCartException {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        try {
            super.add(request, response, model, addToCartItem);

            if (addToCartItem.getItemAttributes() == null || addToCartItem.getItemAttributes().size() == 0) {
                responseMap.put("productId", addToCartItem.getProductId());
            }
            responseMap.put("productName", catalogService.findProductById(addToCartItem.getProductId()).getName());
            responseMap.put("quantityAdded", addToCartItem.getQuantity());
            responseMap.put("cartItemCount", String.valueOf(CartState.getCart().getItemCount()));
            if (addToCartItem.getItemAttributes() == null || addToCartItem.getItemAttributes().size() == 0) {
                // We don't want to return a productId to hide actions for when it is a product that has multiple
                // product options. The user may want the product in another version of the options as well.
                responseMap.put("productId", addToCartItem.getProductId());
            }
        } catch (AddToCartException e) {
            if (e.getCause() instanceof RequiredAttributeNotProvidedException) {
                responseMap.put("error", "allOptionsRequired");
            } else if (e.getCause() instanceof ProductOptionValidationException) {
                ProductOptionValidationException exception = (ProductOptionValidationException) e.getCause();
                responseMap.put("error", "productOptionValidationError");
                responseMap.put("errorCode", exception.getErrorCode());
                responseMap.put("errorMessage", exception.getMessage());
            } else if (ExceptionUtils.getRootCause(e) instanceof InventoryUnavailableException) {
                responseMap.put("error", "库存不足!");
            } else if (ExceptionUtils.getRootCause(e) instanceof ExceededMaxPurchaseQuantityLimitException) {
                ExceededMaxPurchaseQuantityLimitException exception = (ExceededMaxPurchaseQuantityLimitException) ExceptionUtils.getRootCause(e);
                responseMap.put("error", "超出最大购买数量限制:" + exception.getMaxQuantityLimit() + ",已经添加数量:" + (exception.getQuantityRrequested() - 1));
            } else if (ExceptionUtils.getRootCause(e) instanceof FiveCardUnlockException) {
                responseMap.put("error", "五折卡还未解锁哦，赶快去解锁吧!");
            } else {
                throw e;
            }
        }

        return responseMap;
    }

    /*
     * The Heat Clinic does not support adding products with required product options from a category browse page
     * when JavaScript is disabled. When this occurs, we will redirect the user to the full product details page 
     * for the given product so that the required options may be chosen.
     */
    // @RequestMapping(value = "/add", produces = {"text/html", "*/*"})
    /*public String add(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes,
                      @ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, AddToCartException {
        try {
            return super.add(request, response, model, addToCartItem);
        } catch (AddToCartException e) {
            Product product = catalogService.findProductById(addToCartItem.getProductId());
            return "redirect:" + product.getUrl();
        }
    }*/

    @RequestMapping("/updateQuantity")
    @ResponseBody
    public Map<String, Object> updateQuantity(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes,
                                              @ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, UpdateCartException, RemoveFromCartException {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        try {
            super.updateQuantity(request, response, model, addToCartItem);
            responseMap.put("productName", catalogService.findProductById(addToCartItem.getProductId()).getName());
            responseMap.put("quantityAdded", addToCartItem.getQuantity());
            responseMap.put("cartItemCount", String.valueOf(CartState.getCart().getItemCount()));
        } catch (UpdateCartException e) {
            if (e.getCause() instanceof RequiredAttributeNotProvidedException) {
                responseMap.put("error", "allOptionsRequired");
            } else if (e.getCause() instanceof ProductOptionValidationException) {
                ProductOptionValidationException exception = (ProductOptionValidationException) e.getCause();
                responseMap.put("error", "productOptionValidationError");
                responseMap.put("errorCode", exception.getErrorCode());
                responseMap.put("errorMessage", exception.getMessage());
            } else if (ExceptionUtils.getRootCause(e) instanceof InventoryUnavailableException) {
                responseMap.put("error", "库存不足!");
            } else if (ExceptionUtils.getRootCause(e) instanceof ExceededMaxPurchaseQuantityLimitException) {
                ExceededMaxPurchaseQuantityLimitException exception = (ExceededMaxPurchaseQuantityLimitException) ExceptionUtils.getRootCause(e);
                responseMap.put("error", "超出最大购买数量限制:" + exception.getMaxQuantityLimit() + ",已经添加数量:" + (exception.getQuantityRrequested() - 1));
            } else {
                throw e;
            }
        }
        return responseMap;
    }

    @Override
    @RequestMapping("/remove")
    public String remove(HttpServletRequest request, HttpServletResponse response, Model model,
                         @ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, RemoveFromCartException {
        return super.remove(request, response, model, addToCartItem);
    }

    @Override
    @RequestMapping("/empty")
    public String empty(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return super.empty(request, response, model);
    }

    @Override
    @RequestMapping("/promo")
    public String addPromo(HttpServletRequest request, HttpServletResponse response, Model model,
                           @RequestParam("promoCode") String customerOffer) throws IOException, PricingException {
        return super.addPromo(request, response, model, customerOffer);
    }

    @Override
    @RequestMapping("/promo/remove")
    public String removePromo(HttpServletRequest request, HttpServletResponse response, Model model,
                              @RequestParam("offerCodeId") Long offerCodeId) throws IOException, PricingException {
        return super.removePromo(request, response, model, offerCodeId);
    }

}
