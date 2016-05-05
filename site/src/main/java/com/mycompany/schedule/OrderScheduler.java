package com.mycompany.schedule;

import com.mycompany.sample.util.CommonUtils;
import com.mycompany.service.CustomOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by jackie on 5/2/2016.
 */
@Component
public class OrderScheduler {
    private static final Log LOG = LogFactory.getLog(OrderScheduler.class);
    @Resource
    private CustomOrderService orderService;

    @Scheduled(fixedDelay = 15 * 60 * 1000,initialDelay = 60*1000)
    public void updateOrder() {
        System.out.println("-----*****cancel order status*****------");
        List<Order> expiredOrder = orderService.findExpiredOrder(15 * 60 * 1000L);
        expiredOrder.stream().forEach(order -> {
            try {
                orderService.customCancelOrder(order.getId());
                LOG.info("cancel order(" + order.getId() + ") at " + CommonUtils.currentDateStr());
            } catch (WorkflowException e) {
                LOG.error("cancel order(" + order.getId() + ") failed caused by:", e);
            }
        });
    }

}
