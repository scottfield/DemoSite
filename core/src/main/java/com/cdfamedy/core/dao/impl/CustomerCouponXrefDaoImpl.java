package com.cdfamedy.core.dao.impl;

import com.cdfamedy.core.dao.CustomerCouponXrefDao;
import com.cdfamedy.core.domain.CustomerCouponXref;
import com.cdfamedy.core.domain.impl.CustomerCouponXrefImpl;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by jackie on 4/27/2016.
 */
@Repository
public class CustomerCouponXrefDaoImpl implements CustomerCouponXrefDao {
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public CustomerCouponXref saveCustomerXref(CustomerCouponXref xref) {
        return em.merge(xref);
    }

    @Override
    public CustomerCouponXref readById(Long id) {
        return em.find(CustomerCouponXrefImpl.class, id);
    }
}
