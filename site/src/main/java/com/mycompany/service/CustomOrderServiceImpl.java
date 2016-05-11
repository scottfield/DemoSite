package com.mycompany.service;

import com.mycompany.sample.dao.CustomOrderDao;
import com.mycompany.worklow.cancelOrder.CancelOrderSeed;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderServiceImpl;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.workflow.Processor;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

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
}
