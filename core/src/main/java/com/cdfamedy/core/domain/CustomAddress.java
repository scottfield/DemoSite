package com.cdfamedy.core.domain;

import org.broadleafcommerce.profile.core.domain.Address;

/**
 * Created by jackie on 4/14/2016.
 */
public interface CustomAddress extends Address {
    Shop getShop();

    void setShop(Shop shop);
}
