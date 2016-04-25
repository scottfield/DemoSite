package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.Shop;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by jackie on 4/14/2016.
 */
@Repository("shopDao")
public class ShopDaoImpl implements ShopDao {
    private static final Log LOG = LogFactory.getLog(ShopDaoImpl.class);
    @PersistenceContext(unitName = "blPU")
    protected EntityManager em;

    @Override
    public Set<Shop> readAllShop() {
        Query query = em.createQuery("SELECT shop FROM com.mycompany.sample.core.catalog.domain.Shop shop");
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        List resultList = query.getResultList();
        Set<Shop> shopSet = new HashSet<>(resultList);
        return shopSet;
    }

    @Override
    public Shop readShopByCode(String code) {
        Query query = em.createQuery("SELECT shop FROM com.mycompany.sample.core.catalog.domain.Shop shop where shop.code=:code");
        query.setParameter("code", code);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        Shop shop = null;
        try {
            shop = (Shop) query.getSingleResult();
        } catch (NoResultException e) {
            LOG.warn("------cannot find shop with shop code:" + code + "--------");
        }
        return shop;
    }
}
