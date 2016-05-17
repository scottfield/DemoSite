package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.QRCode;

/**
 * Created by jackie on 4/21/2016.
 */
public interface QRCodeService {
    /**
     * 根据code查询二维码
     * @param code
     * @return
     */
    QRCode readByCode(String code);

    /**
     * 检测qrcode是否可用
     * @param code
     * @return
     */
    boolean verifyCode(String code);

    void updateQRCode(QRCode qrCode);
}
