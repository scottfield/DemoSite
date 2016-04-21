package com.mycompany.sample.dao;

import org.broadleafcommerce.profile.core.domain.CustomerAttribute;

/**
 * Created by jackie on 4/22/2016.
 */
public interface CustomerAttributeDao {
    CustomerAttribute getAttributeByValue(String value);
}
