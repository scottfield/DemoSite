package com.mycompany.service;

import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.workflow.WorkflowException;

import java.util.Date;
import java.util.List;

/**
 * Created by jackie on 4/20/2016.
 */
public interface CustomOrderService extends OrderService {
    /**
     * cancel the order and update inventory
     * @param orderId
     */
    void customCancelOrder(Long orderId) throws WorkflowException;

    /**
     * 查找过期的订单
     * @param interval 订单最大的有效时间单位(毫秒)
     * @return
     */
    List<Order> findExpiredOrder(Long interval);
}
