package com.cdfamedy.worklow.order;

import org.broadleafcommerce.core.order.domain.Order;

/**
 * Created by jackie on 4/20/2016.
 */
public class CancelOrderSeed implements CancelOrderResponse {
    protected Order order;

    public CancelOrderSeed(Order order) {
        this.order = order;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
