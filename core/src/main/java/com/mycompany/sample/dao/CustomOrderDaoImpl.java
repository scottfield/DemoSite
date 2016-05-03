package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.CustomOrder;
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
        Query query = em.createQuery("select order from org.broadleafcommerce.core.order.domain.Order order where order.submitDate < :expireddDate and order.status=:status");
        Date expiredDate = new Date(System.currentTimeMillis() + interval);
        query.setParameter("expireddDate", expiredDate);
        query.setParameter("status", OrderStatus.getInstance("UNPAID"));
        List orders = query.getResultList();
        return orders;
    }
}
