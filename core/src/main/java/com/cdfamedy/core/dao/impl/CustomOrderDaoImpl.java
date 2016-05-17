package com.cdfamedy.core.dao.impl;

import com.cdfamedy.core.dao.CustomOrderDao;
import org.broadleafcommerce.core.order.dao.OrderDaoImpl;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;

import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by jackie on 5/2/2016.
 */

public class CustomOrderDaoImpl extends OrderDaoImpl implements CustomOrderDao {
    @Override
    public List<Order> readExpiredOrder(Long interval) {
        Query query = em.createNamedQuery("READ_ORDER_BY_STATUS_AND_SUBMIT_DATE");
        Date expiredDate = new Date(System.currentTimeMillis() - interval);
        query.setParameter("expireddDate", expiredDate);

        query.setParameter("status", OrderStatus.getInstance("UNPAID").getType());
        List orders = query.getResultList();
        return orders;
    }

    @Override
    public List<Order> findOrderByStatus(OrderStatus status) {
        Query query = em.createNamedQuery("READ_ORDER_BY_STATUS");
        query.setParameter("status", status.getType());
        return query.getResultList();
    }
}
