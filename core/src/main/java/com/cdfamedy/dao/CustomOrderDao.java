package com.cdfamedy.dao;

import org.broadleafcommerce.core.order.dao.OrderDao;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;

import java.util.List;

/**
 * Created by jackie on 5/2/2016.
 */
public interface CustomOrderDao extends OrderDao {
    List<Order> readExpiredOrder(Long interval);
    /**
     * 根据根据订单状态查询订单
     * @param status
     * @return
     */
    List<Order> findOrderByStatus(OrderStatus status);
}
