package com.cdfamedy.core.service;

import org.broadleafcommerce.profile.core.domain.CustomerAttribute;

/**
 * Created by jackie on 4/22/2016.
 */
public interface CustomerAttributeService {
    CustomerAttribute readCustomerByOpenId(String openId);
}
