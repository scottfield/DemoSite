package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.WeixinOrder;
import org.broadleafcommerce.core.order.domain.Order;

/**
 * Created by jackie on 4/22/2016.
 * 微信支付接口
 */
public interface WeixinPayService {

    /**
     * 统一下单
     *
     * @param order
     * @param createIp
     * @return
     */
    WeixinOrder unifiedOrder(Order order, String createIp);
}
