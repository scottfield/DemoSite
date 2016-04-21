package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.QRCode;

/**
 * Created by jackie on 4/21/2016.
 */
public interface QRCodeDao {
    QRCode readByCode(String code);

    void updateQRCode(QRCode qrCode);
}
