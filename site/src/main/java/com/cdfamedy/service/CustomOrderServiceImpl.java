package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.Shop;
import com.cdfamedy.dao.CustomOrderDao;
import com.cdfamedy.payment.weixin.protocol.QueryOrderReqData;
import com.cdfamedy.payment.weixin.service.WxCallBackData;
import com.cdfamedy.payment.weixin.service.WxPayApi;
import com.cdfamedy.worklow.order.CancelOrderSeed;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderAttribute;
import org.broadleafcommerce.core.order.domain.OrderAttributeImpl;
import org.broadleafcommerce.core.order.service.OrderServiceImpl;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.workflow.Processor;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/20/2016.
 */
public class CustomOrderServiceImpl extends OrderServiceImpl implements CustomOrderService {
    protected static final Log LOG = LogFactory.getLog(CustomOrderServiceImpl.class);
    @Resource(name = "cancelOrderWorkflow")
    private Processor cancelOrderWorkflow;

    @Override
    @Transactional(value = TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public void customCancelOrder(Long orderId) throws WorkflowException {
        TransactionStatus status = TransactionUtils.createTransaction("customCancelOrder",
                TransactionDefinition.PROPAGATION_REQUIRED, transactionManager);
        try {
            Order order = orderDao.readOrderById(orderId);
            CancelOrderSeed seed = new CancelOrderSeed(order);
            cancelOrderWorkflow.doActivities(seed);
            //save order in case any activity modified the order.
            order = seed.getOrder();
            order.setStatus(OrderStatus.CANCELLED);
            orderDao.save(order);
            TransactionUtils.finalizeTransaction(status, transactionManager, false);
        } catch (RuntimeException ex) {
            TransactionUtils.finalizeTransaction(status, transactionManager, true);
            throw new WorkflowException(ex);
        }

    }

    @Override
    public List<Order> findExpiredOrder(Long interval) {
        CustomOrderDao customOrderDao = (CustomOrderDao) orderDao;
        return customOrderDao.readExpiredOrder(interval);
    }

    @Override
    public List<Order> findOrderByStatus(OrderStatus status) {
        CustomOrderDao customOrderDao = (CustomOrderDao) orderDao;
        return customOrderDao.findOrderByStatus(status);
    }

    @Transactional(value = TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public void updateWxOrderInfo() {
        List cancelledOrders = this.findOrderByStatus(OrderStatus.getInstance("PAID"));
        cancelledOrders.stream().forEach(cancelledOrder -> {
            Object[] arr = (Object[]) cancelledOrder;
            String orderNumber = arr[1].toString();
            Shop shop = (Shop) arr[2];
            /*List<String> numbers = new ArrayList<>();
            numbers.add("201605091102156684217");
            numbers.add("201605091116377744221");
            numbers.add("201605091306007874502");
            numbers.add("201605091635025394858");
            numbers.add("201605091951245374897");
            numbers.add("201605092127593145161");
            numbers.add("201605091952167125243");
            numbers.add("201605092104381365297");
            numbers.add("201605092052239085311");
            numbers.add("20160509212215135437");
            numbers.add("201605092139052185541");
            numbers.add("20160509212636955582");
            numbers.add("201605092146136265818");
            numbers.add("201605092207126785861");
            numbers.add("20160509222246216005");
            numbers.add("201605092339076556752");
            numbers.add("201605120004253857877");
            numbers.add("201605111119286099559");
            numbers.add("2016051209111114610688");
            numbers.add("2016051212204443510845");
            if (!numbers.contains(orderNumber)) {
                return;
            }*/
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(orderNumber).build();
            try {
                Map<String, Object> result = WxPayApi.queryOrder(reqData);
                Order order = this.findOrderByOrderNumber(orderNumber);
                LOG.warn("自动更新订单状态为已支付开始,订单号:" + orderNumber + ",当前订单状态:" + order.getStatus().getType());
                if (WxCallBackData.SUCCESS.equals(result.get("trade_state"))) {
                    LOG.warn("更新订单属性,订单号:" + orderNumber + ",当前订单状态:" + order.getStatus().getType());
                    Map<String, OrderAttribute> orderAttributes = order.getOrderAttributes();
                    if (Objects.isNull(orderAttributes)) {
                        orderAttributes = new HashMap<>();
                    }
                    if (orderAttributes.containsKey("trade_state") && WxCallBackData.SUCCESS.equals(orderAttributes.get("trade_state").getValue())) {
                        LOG.warn("已存在,取消更新订单属性,订单号:" + orderNumber + ",当前订单状态:" + order.getStatus().getType());
                        return;
                    }
                    for (String key : result.keySet()) {
                        if (orderAttributes.containsKey(key)) {
                            OrderAttribute orderAttribute = orderAttributes.get(key);
                            orderAttribute.setValue(result.get(key).toString());
                        } else {
                            OrderAttribute orderAttribute = new OrderAttributeImpl();
                            orderAttribute.setName(key);
                            orderAttribute.setValue(result.get(key).toString());
                            orderAttribute.setOrder(order);
                            orderAttributes.put(key, orderAttribute);
                        }
                    }
                    order.setOrderAttributes(orderAttributes);
                    this.save(order, false);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SAXException e) {
                e.printStackTrace();
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            } catch (PricingException e) {
                e.printStackTrace();
            }
        });
    }
}
