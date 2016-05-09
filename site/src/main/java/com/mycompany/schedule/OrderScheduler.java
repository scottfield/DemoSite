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
import java.util.Objects;
import java.util.logging.Logger;

/**
 * Created by jackie on 5/2/2016.
 */
@Component
public class OrderScheduler {
    private static final Log LOG = LogFactory.getLog(OrderScheduler.class);
    @Resource
    private CustomOrderService orderService;

    @Scheduled(fixedDelay = 1 * 60 * 1000, initialDelay = 60 * 1000)
    public void updateOrder() {
//        LOG.debug("-----取消过期订单定时任务开始------");
        List<Order> expiredOrder = orderService.findExpiredOrder(15 * 60 * 1000L);
        if (Objects.isNull(expiredOrder) || expiredOrder.size() == 0) {
            return;
        }
        expiredOrder.stream().forEach(order -> {
            try {
                orderService.customCancelOrder(order.getId());
                LOG.info("取消订单,订单编号:" + order.getOrderNumber());
            } catch (WorkflowException e) {
                LOG.error("取消订单失败,订单编号:" + order.getOrderNumber(), e);
            }
        });
//        LOG.info("-----取消过期订单定时任务结束------");
    }

}
