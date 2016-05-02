package com.mycompany.sample.dao;

import org.broadleafcommerce.core.order.dao.OrderDaoImpl;
import org.broadleafcommerce.core.order.domain.Order;

import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by jackie on 5/2/2016.
 */

public class CustomOrderDaoImpl extends OrderDaoImpl implements CustomOrderDao {
    @Override
    public List<Order> readExpiredOrder(Long interval) {
        Query query = em.createQuery("select order from org.broadleafcommerce.core.order.domain.Order order where order.submitDate < :expireddDate");
        Date expiredDate = new Date(System.currentTimeMillis() + interval);
        query.setParameter("expireddDate", expiredDate);
        List orders = query.getResultList();
        return orders;
    }
}
