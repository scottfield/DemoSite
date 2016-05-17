package com.cdfamedy.core.dao.impl;

import com.cdfamedy.core.dao.CustomerAttributeDao;
import org.broadleafcommerce.profile.core.domain.CustomerAttribute;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by jackie on 4/22/2016.
 */
@Repository
public class CustomerAttributeDaoImpl implements CustomerAttributeDao {
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public CustomerAttribute getAttributeByValue(String value) {
        Query query = em.createNamedQuery("READ_ATTRIBUTE_BY_VALUE");
        query.setParameter("value", value);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        List resultList = query.getResultList();
        if (resultList.isEmpty()) {
            return null;
        }
        return (CustomerAttribute) resultList.get(0);
    }
}
