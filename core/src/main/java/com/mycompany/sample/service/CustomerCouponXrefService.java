package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.CustomerCouponXref;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CustomerCouponXrefService {
    CustomerCouponXref saveCustomerXref(CustomerCouponXref xref);
    CustomerCouponXref readById(Long id);
}
