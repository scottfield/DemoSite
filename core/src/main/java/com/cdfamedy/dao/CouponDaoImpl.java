package com.cdfamedy.dao;

import com.cdfamedy.core.catalog.domain.Coupon;
import com.cdfamedy.core.catalog.domain.CouponImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by jackie on 4/27/2016.
 */
@Repository
public class CouponDaoImpl implements CouponDao {
    private static final Log LOG = LogFactory.getLog(CouponDaoImpl.class);
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public Coupon readById(Long id) {
        return em.find(CouponImpl.class, id);
    }

    @Override
    public Coupon readByType(Integer type) {
        Query query = em.createQuery("select coupon from com.cdfamedy.sample.core.catalog.domain.Coupon coupon where coupon.type=:type");
        query.setParameter("type", type);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        Coupon coupon = null;
        try {
            coupon = (Coupon) query.getSingleResult();
        } catch (NoResultException e) {
            LOG.info("类型为:" + type + "的优惠券不存在");
        }
        return coupon;
    }

    @Override
    public Coupon readByAmount(Integer amount) {
        Query query = em.createQuery("select coupon from com.cdfamedy.sample.core.catalog.domain.Coupon coupon where coupon.type=:amount");
        query.setParameter("amount", amount);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        Coupon coupon = null;
        try {
            coupon = (Coupon) query.getSingleResult();
        } catch (NoResultException e) {
            LOG.info("数量为:" + amount + "的优惠券不存在");
        }
        return coupon;
    }

    @Override
    public Coupon saveCoupon(Coupon coupon) {
        return em.merge(coupon);
    }
}
