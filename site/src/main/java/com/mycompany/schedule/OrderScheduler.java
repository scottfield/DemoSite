package com.mycompany.schedule;

import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.payment.weixin.protocol.QueryOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxCallBackData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.service.CustomOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.*;

/**
 * Created by jackie on 5/2/2016.
 */
@Component
public class OrderScheduler {
    private static final Log LOG = LogFactory.getLog(OrderScheduler.class);
    @Resource
    private CustomOrderService orderService;

    @Scheduled(fixedDelay = 30 * 60 * 1000, initialDelay = 60 * 1000)
    public void cancelOrder() {
//        LOG.debug("-----取消过期订单定时任务开始------");
        List<Order> expiredOrder = orderService.findExpiredOrder(15 * 60 * 1000L);
        if (Objects.isNull(expiredOrder) || expiredOrder.size() == 0) {
            return;
        }
        expiredOrder.stream().forEach(order -> {
            try {
                LOG.warn("自动取消订单开始,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
                orderService.customCancelOrder(order.getId());
                LOG.warn("自动取消订单完成,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
            } catch (WorkflowException e) {
                LOG.error("自动取消订单失败,订单号:" + order.getOrderNumber(), e);
            }
        });
//        LOG.info("-----取消过期订单定时任务结束------");
    }

    @Scheduled(fixedDelay = 60 * 60 * 1000, initialDelay = 60 * 1000)
    public void updateOrderStatus() {
        List cancelledOrders = orderService.findOrderByStatus(OrderStatus.getInstance("PAYING"));
        for (Object cancelledOrder : cancelledOrders) {
            Object[] arr = (Object[]) cancelledOrder;
            String orderNumber = arr[1].toString();
            Shop shop = (Shop) arr[2];
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(orderNumber).build();
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.MINUTE, -15);
            Date now = calendar.getTime();
            try {
                Map<String, Object> result = WxPayApi.queryOrder(reqData);
                Order order = orderService.findOrderByOrderNumber(orderNumber);
                LOG.warn("自动更新订单状态为已支付开始,订单号:" + orderNumber + ",当前订单状态:" + order.getStatus().getType());
                if (WxCallBackData.SUCCESS.equals(result.get("trade_state"))) {
                    order.setStatus(OrderStatus.getInstance("PAID"));
                } else if (order.getSubmitDate().before(now)) {
                    order.setStatus(OrderStatus.CANCELLED);
                } else {
                    order.setStatus(OrderStatus.getInstance("UNPAID"));
                }
                orderService.save(order, false);
                LOG.warn("自动更新订单状态为已支付结束,订单号:" + orderNumber + ",当前订单状态:" + order.getStatus().getType());
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SAXException e) {
                e.printStackTrace();
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            } catch (PricingException e) {
                e.printStackTrace();
            }
        }
    }

}
