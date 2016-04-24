package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.CustomerImpl;

import javax.persistence.*;

/**
 * Created by jackie on 4/23/2016.
 */
@Entity
@Table(name = "customer_extend")
public class CustomCustomerImpl extends CustomerImpl implements CustomCustomer {
    @OneToOne(targetEntity = CustomerFiveCardXrefImpl.class, mappedBy = "customer",cascade = CascadeType.ALL)
    private CustomerFiveCardXref fiveCardXref;
    @Column(name = "test")
    private String test;

    public CustomerFiveCardXref getFiveCardXref() {
        return fiveCardXref;
    }

    public void setFiveCardXref(CustomerFiveCardXref fiveCardXref) {
        this.fiveCardXref = fiveCardXref;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }
}
