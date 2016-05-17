package com.cdfamedy.dao;

import com.cdfamedy.core.catalog.domain.QRCode;

/**
 * Created by jackie on 4/21/2016.
 */
public interface QRCodeDao {
    QRCode readByCode(String code);

    void updateQRCode(QRCode qrCode);
}
