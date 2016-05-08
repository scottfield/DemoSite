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

import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.payment.weixin.protocol.QueryOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.JsonHelper;
import com.mycompany.sample.util.JsonResponse;
import com.mycompany.service.CustomOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/account/orders")
public class OrderHistoryController extends BroadleafOrderHistoryController {
    private static final Log LOG = LogFactory.getLog(OrderHistoryController.class);
    /**
     * 未付款订单有效期(15分钟)
     */
    private static final long MAX_ORDER_INTERVAL = 15 * 60 * 1000;
    /**
     * 自定义订单状态
     */
    /**
     * 未付款
     */
    private static OrderStatus UNPAID = new OrderStatus("UNPAID", "UNPAID");
    /**
     * 已付款
     */
    private static OrderStatus PAID = new OrderStatus("PAID", "PAID");
    /**
     * 已提货
     */
    private static OrderStatus CONSUMED = new OrderStatus("CONSUMED", "CONSUMED");

    @Resource(name = "blOrderService")
    private CustomOrderService customOrderService;

    @RequestMapping(method = RequestMethod.GET)
    public String viewOrderHistory(HttpServletRequest request, Model model) {
        List<Order> orders = customOrderService.findOrdersForCustomer(CustomerState.getCustomer());
        orders = orders.stream().filter(order -> order.getStatus() != OrderStatus.IN_PROCESS).collect(Collectors.toList());
        orders.stream().forEach(order -> {
            /**
             * 取消过期订单
             */
            Date submitDate = new Date(order.getSubmitDate().getTime() + MAX_ORDER_INTERVAL);
            Date now = new Date();
            if (order.getStatus().equals(UNPAID) && submitDate.before(now)) {
                try {
                    customOrderService.customCancelOrder(order.getId());
                } catch (WorkflowException e) {
                    LOG.warn("自动取消订单失败,订单号：" + order.getId());
                }
            }
        });
        orders.sort((o1, o2) -> o2.getSubmitDate().compareTo(o1.getSubmitDate()));
        model.addAttribute("orders", orders);
        model.addAttribute("now", new Date());
        model.addAttribute("couponValue", request.getParameter("couponValue"));
        model.addAttribute("showCoupon", "true".equals(request.getParameter("showCoupon")));
        return getOrderHistoryView();
    }

    /**
     * 支付成功后确认订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/confirm")
    @ResponseBody
    public Object confirmOrder(long orderId) {
        JsonResponse result = JsonResponse.response("更新订单成功.");
        Order order = orderService.findOrderById(orderId);
        if (Objects.isNull(order)) {
            LOG.info("订单号：" + orderId + "不存在.");
            result.setMessage("更新订单失败，订单号:" + orderId + " 不存在");
            result.setCode(JsonResponse.FAIL_CODE);
            return result;
        }


        try {
            //调用微信支付订单查询接口确认订单状态
            if (order instanceof CustomOrder) {
                CustomOrder customOrder = (CustomOrder) order;
                Shop shop = customOrder.getAddress().getShop();
                String appid = shop.getAppId();
                String mch_id = shop.getMchid();
                String out_trade_no = order.getOrderNumber();
                QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(appid).setMch_id(mch_id).setOut_trade_no(out_trade_no).build();
                Map<String, Object> queryOrderResult = WxPayApi.queryOrder(reqData);
                if (!"SUCCESS".equals(queryOrderResult.get("trade_state"))) {
                    result.setCode(JsonResponse.FAIL_CODE);
                    result.setMessage("微信订单支付失败！");
                    LOG.warn(JsonHelper.toJsonStr(queryOrderResult));
                    return result;
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        order.setStatus(PAID);
        try {
            orderService.save(order, false);
            LOG.info("更新订单(单号:" + orderId + ")成功.");
        } catch (PricingException e) {
            LOG.error("更新订单(单号:" + orderId + ")失败", e);
            result.setMessage("更新订单成功.");
            result.setCode(JsonResponse.FAIL_CODE);
        }
        return result;
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
