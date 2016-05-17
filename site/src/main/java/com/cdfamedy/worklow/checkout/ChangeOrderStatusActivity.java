package com.cdfamedy.worklow.checkout;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
    private static final Log LOG = LogFactory.getLog(ChangeOrderStatusActivity.class);

    @Override
    public ProcessContext<CheckoutSeed> execute(ProcessContext<CheckoutSeed> context) throws Exception {
        CheckoutSeed seed = context.getSeedData();
        Order order = seed.getOrder();
        order.setStatus(orderStatus);
        LOG.warn("修改订单状态,订单号:" + order.getOrderNumber() + ",订单状态" + order.getStatus().getType());
        return context;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }
}
