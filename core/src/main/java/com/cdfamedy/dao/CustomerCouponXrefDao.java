package com.cdfamedy.dao;

import com.cdfamedy.core.catalog.domain.CustomerCouponXref;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CustomerCouponXrefDao {

    CustomerCouponXref saveCustomerXref(CustomerCouponXref xref);

    CustomerCouponXref readById(Long id);
}
