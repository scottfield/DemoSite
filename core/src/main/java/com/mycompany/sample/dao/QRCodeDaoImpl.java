package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.QRCode;
import org.hibernate.ejb.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by jackie on 4/21/2016.
 */
@Repository("qrcodeDao")
public class QRCodeDaoImpl implements QRCodeDao {
    @PersistenceContext(unitName = "blPU")
    private EntityManager em;

    @Override
    public QRCode readByCode(String code) {
        Query query = em.createQuery("SELECT qrcode FROM com.mycompany.sample.core.catalog.domain.QRCode qrcode where qrcode.code = :code");
        query.setParameter("code", code);
        query.setHint(QueryHints.HINT_CACHEABLE, true);
        QRCode qrCode = (QRCode) query.getSingleResult();
        return qrCode;
    }

    @Override
    public void updateQRCode(QRCode qrCode) {
        em.merge(qrCode);
    }
}
