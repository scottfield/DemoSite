package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.Customer;

import java.util.Date;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CustomerCouponXref {
    boolean STATUS_UNUSE = false;
    boolean STATUS_USED = true;

    Coupon getCoupon();

    void setCoupon(Coupon coupon);

    Date getCreatedOn();

    void setCreatedOn(Date createdOn);

    Customer getCustomer();

    void setCustomer(Customer customer);

    Long getId();

    void setId(Long id);

    Boolean getStatus();

    void setStatus(Boolean status);

    Date getUpdatedOn();

    void setUpdatedOn(Date updatedOn);
}
