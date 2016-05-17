package com.cdfamedy.core.dao.impl;

import com.cdfamedy.core.dao.FiveCardDao;
import com.cdfamedy.core.domain.FiveCard;
import com.cdfamedy.core.domain.impl.FiveCardImpl;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
@Repository("fiveCardDao")
public class FiveCardDaoImpl implements FiveCardDao {
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public FiveCard readById(Integer id) {
        return em.find(FiveCardImpl.class, id);
    }

    @Override
    public List<FiveCard> readAllFiveCard() {
        Query query = em.createNamedQuery("READ_ALL_FIVE_CARD");
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        return query.getResultList();
    }

    @Override
    public void saveFiveCard(FiveCard fiveCard) {
        em.merge(fiveCard);
    }

    @Override
    public FiveCard readByStatusAndType(Boolean status, Integer type) {
        Query query = em.createNamedQuery("READ_FIVE_CARD_BY_TYPE_AND_STATUS");
        query.setParameter("status", status);
        query.setParameter("type", type);
        query.setMaxResults(1);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        List resultList = query.getResultList();
        if (resultList.size() > 0) {
            return (FiveCard) resultList.get(0);
        }
        return null;
    }

    @Override
    public Long getAvailableFiveCardQuantity(Integer type) {
        Query query = em.createNamedQuery("READ_AVAILABLE_FIVE_CARD_QUANTITY_BY_TYPE");
        query.setParameter("type", type);
        query.setParameter("status", false);
        Object quantity = query.getSingleResult();
        return (Long) quantity;
    }

    @Override
    public Long getTotalFiveCardQuantityByType(Integer type) {
        Query query = em.createNamedQuery("READ_FIVE_CARD_TOTAL_QUANTITY_BY_TYPE");
        query.setParameter("type", type);
        Object quantity = query.getSingleResult();
        return (Long) quantity;
    }
}
