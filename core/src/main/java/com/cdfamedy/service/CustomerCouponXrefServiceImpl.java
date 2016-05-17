package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.CustomerCouponXref;
import com.cdfamedy.dao.CustomerCouponXrefDao;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by jackie on 4/27/2016.
 */
@Service
public class CustomerCouponXrefServiceImpl implements CustomerCouponXrefService {
    @Resource
    private CustomerCouponXrefDao xrefDao;

    @Override
    @Transactional(TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public CustomerCouponXref saveCustomerXref(CustomerCouponXref xref) {
        return xrefDao.saveCustomerXref(xref);
    }

    @Override
    public CustomerCouponXref readById(Long id) {
        return xrefDao.readById(id);
    }
}
