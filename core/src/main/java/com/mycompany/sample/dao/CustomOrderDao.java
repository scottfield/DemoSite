package com.mycompany.sample.dao;

import org.broadleafcommerce.core.order.dao.OrderDao;
import org.broadleafcommerce.core.order.domain.Order;

import java.util.Date;
import java.util.List;

/**
 * Created by jackie on 5/2/2016.
 */
public interface CustomOrderDao extends OrderDao {
    List<Order> readExpiredOrder(Long interval);
}
