package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.CustomerCouponXref;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CustomerCouponXrefDao {

    CustomerCouponXref saveCustomerXref(CustomerCouponXref xref);

    CustomerCouponXref readById(Long id);
}
