package com.cdfamedy.core.service;

import com.cdfamedy.core.domain.Coupon;

/**
 * Created by jackie on 4/27/2016.
 */
public interface CouponService {
    Coupon readById(Long id);

    Coupon readByType(Integer type);
    Coupon readByAmount(Integer amount);
    Coupon saveCoupon(Coupon coupon);
}
