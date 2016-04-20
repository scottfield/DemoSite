package com.mycompany.worklow.checkout;

import org.broadleafcommerce.core.checkout.service.workflow.CheckoutSeed;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

/**
 * Created by jackie on 4/20/2016.
 */
public class ChangeOrderStatusActivity extends BaseActivity<ProcessContext<CheckoutSeed>> {

    private OrderStatus orderStatus;

    @Override
    public ProcessContext<CheckoutSeed> execute(ProcessContext<CheckoutSeed> context) throws Exception {
        CheckoutSeed seed = context.getSeedData();
        Order order = seed.getOrder();
        order.setStatus(orderStatus);
        return context;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }
}
