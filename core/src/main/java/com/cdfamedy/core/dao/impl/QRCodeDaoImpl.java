package com.cdfamedy.core.dao.impl;

import com.cdfamedy.core.dao.QRCodeDao;
import com.cdfamedy.core.domain.QRCode;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by jackie on 4/21/2016.
 */
@Repository("qrcodeDao")
public class QRCodeDaoImpl implements QRCodeDao {
    private static final Log LOG = LogFactory.getLog(QRCodeDaoImpl.class);
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public QRCode readByCode(String code) {
        Query query = em.createNamedQuery("READ_QR_CODE_BY_CODE");
        query.setParameter("code", code);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        try {
            Object qrCode = query.getSingleResult();
            return (QRCode) qrCode;
        } catch (NoResultException e) {
            LOG.info("--------qr code:" + code + " not exist.---------");
        }
        return null;
    }

    @Override
    public void updateQRCode(QRCode qrCode) {
        em.merge(qrCode);
    }
}
