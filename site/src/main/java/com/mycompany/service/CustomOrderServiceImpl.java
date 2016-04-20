package com.mycompany.service;

import com.mycompany.worklow.cancelOrder.CancelOrderSeed;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderServiceImpl;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.workflow.Processor;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by jackie on 4/20/2016.
 */
public class CustomOrderServiceImpl extends OrderServiceImpl implements CustomOrderService {
    protected static final Log LOG = LogFactory.getLog(CustomOrderServiceImpl.class);
    @Resource(name = "cancelOrderWorkflow")
    private Processor cancelOrderWorkflow;

    @Override
    @Transactional("blTransactionManager")
    public void customCancelOrder(Long orderId) throws WorkflowException {
        LOG.info("取消订单[订单ID:"+orderId+"]");
        Order order = orderDao.readOrderById(orderId);
        CancelOrderSeed seed = new CancelOrderSeed(order);
        cancelOrderWorkflow.doActivities(seed);
        //save order in case any activity modified the order.
        order = seed.getOrder();
        order.setStatus(OrderStatus.CANCELLED);
        orderDao.save(order);
    }
}
