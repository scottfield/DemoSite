package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.Customer;

/**
 * Created by jackie on 4/23/2016.
 */
public interface CustomCustomer extends Customer {
    CustomerFiveCardXref getFiveCardXref();

    void setFiveCardXref(CustomerFiveCardXref fiveCardXref);
    String getTest();

    void setTest(String test);
}
