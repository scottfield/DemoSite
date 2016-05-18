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
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.protocol.QueryOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxCallBackData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.JsonHelper;
import com.mycompany.sample.util.JsonResponse;
import com.mycompany.service.CustomOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderAttribute;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
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
    public static OrderStatus UNPAID = new OrderStatus("UNPAID", "UNPAID");
    /**
     * 已付款
     */
    public static OrderStatus PAID = new OrderStatus("PAID", "PAID");
    /**
     * 付款中
     */
    public static OrderStatus PAYING = new OrderStatus("PAYING", "PAYING");
    /**
     * 已提货
     */
    public static OrderStatus CONSUMED = new OrderStatus("CONSUMED", "CONSUMED");

    @Resource(name = "blOrderService")
    private CustomOrderService customOrderService;

    @RequestMapping(method = RequestMethod.GET)
    public String viewOrderHistory(HttpServletRequest request, Model model) {
        List<Order> orders = customOrderService.findOrdersForCustomer(CustomerState.getCustomer());
        orders = orders.stream().filter(order -> order.getStatus() != OrderStatus.IN_PROCESS).collect(Collectors.toList());
        orders.stream().forEach(this::cancelExpiredOrder);
        orders.sort((o1, o2) -> o2.getSubmitDate().compareTo(o1.getSubmitDate()));
        model.addAttribute("orders", orders);
        model.addAttribute("now", new Date());
        model.addAttribute("couponValue", request.getParameter("couponValue"));
        model.addAttribute("showCoupon", "true".equals(request.getParameter("showCoupon")));
        return getOrderHistoryView();
    }

    private void cancelExpiredOrder(Order order) {
        Date submitDate = new Date(order.getSubmitDate().getTime() + MAX_ORDER_INTERVAL);
        Date now = new Date();
        //检测订单是否为未付款,或支付中,或超时的订单
        if ((!order.getStatus().equals(UNPAID)) || (!order.getStatus().equals(PAYING)) || (!submitDate.before(now))) {
            return;
        }

        CustomOrder customOrder = (CustomOrder) order;
        //检测订单是否已通过微信回调函数写入返回结果
        Map<String, OrderAttribute> orderAttributes = customOrder.getOrderAttributes();
        if (Objects.nonNull(orderAttributes) && orderAttributes.containsKey("result_code") && WxCallBackData.SUCCESS.equals(orderAttributes.get("result_code").getValue())) {
            saveOrder(order);
            return;
        }
        //调用微信查询订单接口查询订单状态
        Shop shop = customOrder.getAddress().getShop();
        QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(customOrder.getOrderNumber()).build();
        try {
            Map<String, Object> result = WxPayApi.queryOrder(reqData);
            WxCallBackData callBackData = JsonUtil.fromJson(JsonHelper.toJsonStr(result), WxCallBackData.class);
            if (WxCallBackData.SUCCESS.equals(callBackData.getTrade_state())) {
                saveOrder(order);
                return;
            }
        } catch (IOException e) {
            LOG.error("io错误", e);
        } catch (SAXException e) {
            LOG.error("xml解析错误", e);
        } catch (ParserConfigurationException e) {
            LOG.error("解析xml错误", e);
        }
//        取消过期订单
        try {
            LOG.warn("自动取消订单开始,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
            customOrderService.customCancelOrder(order.getId());
            LOG.warn("自动取消订单完成,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
        } catch (WorkflowException e) {
            LOG.warn("自动取消订单失败,订单号：" + order.getId());
        }
    }

    private void saveOrder(Order order) {
        try {
            order.setStatus(PAID);
            orderService.save(order, false);
            LOG.warn("更新订单状态为已支付,订单号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
        } catch (PricingException e) {
            LOG.error("更新订单失败", e);
        }
    }

    /**
     * 支付成功后确认订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/confirm")
    @ResponseBody
    public Object confirmOrder(@RequestParam Long orderId) {
        JsonResponse result = JsonResponse.response("更新订单成功.");
        Order order = orderService.findOrderById(orderId);
        LOG.warn("检测订单状态开始,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
        if (Objects.isNull(order)) {
            LOG.warn("订单号：" + orderId + "不存在.");
            result.setMessage("更新订单失败，订单号:" + orderId + " 不存在");
            result.setCode(JsonResponse.FAIL_CODE);
            return result;
        }
        try {
            //调用微信支付订单查询接口确认订单状态
            CustomOrder customOrder = (CustomOrder) order;
            Shop shop = customOrder.getAddress().getShop();
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(order.getOrderNumber()).build();
            Map<String, Object> queryOrderResult = WxPayApi.queryOrder(reqData);
            if (WxCallBackData.SUCCESS.equals(queryOrderResult.get("trade_state"))) {
                LOG.warn("更新订单状态,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
                order.setStatus(PAID);
                CustomOrderService customOrderService = (CustomOrderService) orderService;
                customOrderService.updateOrderAttribute(order, queryOrderResult);
                LOG.warn("更新订单状态完成,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
                return result;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        LOG.warn("检测订单状态结束,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
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

    @RequestMapping("/test")
    public String test(HttpServletRequest request, Model model) {
        List<Order> orders = customOrderService.findOrdersForCustomer(CustomerState.getCustomer());
        orders = orders.stream().filter(order -> order.getStatus() != OrderStatus.IN_PROCESS).collect(Collectors.toList());
        orders.stream().forEach(this::cancelExpiredOrder);
        orders.sort((o1, o2) -> o2.getSubmitDate().compareTo(o1.getSubmitDate()));
        model.addAttribute("orders", orders);
        model.addAttribute("now", new Date());
        model.addAttribute("couponValue", request.getParameter("couponValue"));
        model.addAttribute("showCoupon", "true".equals(request.getParameter("showCoupon")));
        return "/account/test";
    }

}
