package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.CustomerCouponXref;
import com.mycompany.sample.core.catalog.domain.CustomerCouponXrefImpl;
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
