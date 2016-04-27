package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.Coupon;
import com.mycompany.sample.dao.CouponDao;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by jackie on 4/27/2016.
 */
@Service
public class CouponServiceImpl implements CouponService {
    @Resource
    private CouponDao couponDao;

    @Override
    public Coupon readById(Long id) {
        return couponDao.readById(id);
    }

    @Override
    public Coupon readByType(Integer type) {
        return couponDao.readByType(type);
    }

    @Override
    public Coupon readByAmount(Integer amount) {
        return couponDao.readByAmount(amount);
    }

    @Override
    @Transactional(TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public Coupon saveCoupon(Coupon coupon) {
        return couponDao.saveCoupon(coupon);
    }
}
