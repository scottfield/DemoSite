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

import com.mycompany.service.CustomOrderService;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/account/orders")
public class OrderHistoryController extends BroadleafOrderHistoryController {
    //初始化自定义订单状态
    static {
        new OrderStatus("UNPAID", "UNPAID");
        new OrderStatus("PAID", "PAID");
        new OrderStatus("CONSUMED", "CONSUMED");
    }

    @Resource(name = "blOrderService")
    private CustomOrderService customOrderService;

    @RequestMapping(method = RequestMethod.GET)
    public String viewOrderHistory(HttpServletRequest request, Model model) {
        List<Order> orders = customOrderService.findOrdersForCustomer(CustomerState.getCustomer());
        orders.stream().filter(order -> order.getStatus() != OrderStatus.IN_PROCESS);
        model.addAttribute("orders", orders);
        return getOrderHistoryView();
    }

    @RequestMapping(value = "/detail/{orderNumber}", method = RequestMethod.GET)
    public String viewOrderDetails(HttpServletRequest request, Model model, @PathVariable("orderNumber") String orderNumber) {
        return super.viewOrderDetails(request, model, orderNumber);
    }

    @RequestMapping(value = "/cancel/{orderId}", method = RequestMethod.GET)
    public String cancelOrder(HttpServletRequest request, Model model, @PathVariable("orderId") Long orderId) {
        try {
            customOrderService.customCancelOrder(orderId);
        } catch (WorkflowException e) {
            model.addAttribute("errorMsg", "取消订单失败[订单编号:" + orderId + "]");
        }
        return "redirect:/account/orders";
    }

}
