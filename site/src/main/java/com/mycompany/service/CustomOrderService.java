package com.mycompany.service;

import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.workflow.WorkflowException;

/**
 * Created by jackie on 4/20/2016.
 */
public interface CustomOrderService extends OrderService {
    /**
     * cancel the order and update inventory
     * @param orderId
     */
    void customCancelOrder(Long orderId) throws WorkflowException;
}
