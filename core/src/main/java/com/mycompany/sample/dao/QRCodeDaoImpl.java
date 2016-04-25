package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.QRCode;
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
        Query query = em.createQuery("SELECT qrcode FROM com.mycompany.sample.core.catalog.domain.QRCode qrcode where qrcode.code = :code");
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
