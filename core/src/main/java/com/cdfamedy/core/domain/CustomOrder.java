package com.cdfamedy.core.domain;

import org.broadleafcommerce.core.order.domain.Order;

/**
 * Created by jackie on 5/3/2016.
 */
public interface CustomOrder extends Order {
    CustomAddress getAddress();

    void setAddress(CustomAddress address);

}
