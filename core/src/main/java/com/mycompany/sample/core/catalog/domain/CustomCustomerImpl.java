package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.CustomerImpl;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
@Entity
@Table(name = "customer_extend")
public class CustomCustomerImpl extends CustomerImpl implements CustomCustomer {
    @OneToOne(targetEntity = CustomerFiveCardXrefImpl.class, mappedBy = "customer", cascade = CascadeType.ALL)
    private CustomerFiveCardXref fiveCardXref;
    @Column(name = "test")
    private String test;
    @OneToMany(targetEntity = CustomerCouponXrefImpl.class, mappedBy = "customer", cascade = CascadeType.ALL)
    private List<CustomerCouponXref> couponXrefs = new ArrayList<>();

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

    public List<CustomerCouponXref> getCouponXrefs() {
        return couponXrefs;
    }

    public void setCouponXrefs(List<CustomerCouponXref> couponXrefs) {
        this.couponXrefs = couponXrefs;
    }
}
