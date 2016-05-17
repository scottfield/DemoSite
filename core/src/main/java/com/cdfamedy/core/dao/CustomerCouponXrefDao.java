package com.cdfamedy.core.dao;

import com.cdfamedy.core.domain.CustomerCouponXref;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CustomerCouponXrefDao {

    CustomerCouponXref saveCustomerXref(CustomerCouponXref xref);

    CustomerCouponXref readById(Long id);
}
