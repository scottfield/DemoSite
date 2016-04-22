package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.OrderParam;
import com.mycompany.sample.core.catalog.domain.WeixinOrder;
import org.broadleafcommerce.core.order.domain.Order;
import org.springframework.stereotype.Service;

/**
 * Created by jackie on 4/22/2016.
 */
@Service
public class WeixinPayServiceImpl implements WeixinPayService {
    @Override
    public WeixinOrder unifiedOrder(Order order, String createIp) {
        OrderParam param = OrderParam.getInstance(order);
        param.setSpbillCreateIp(createIp);


        return null;
    }
}
