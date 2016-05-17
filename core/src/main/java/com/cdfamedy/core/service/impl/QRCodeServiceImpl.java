package com.cdfamedy.core.service.impl;

import com.cdfamedy.core.dao.QRCodeDao;
import com.cdfamedy.core.domain.QRCode;
import com.cdfamedy.core.service.QRCodeService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * Created by jackie on 4/21/2016.
 */
@Service("qrcodeService")
public class QRCodeServiceImpl implements QRCodeService {
    private static final Log LOG = LogFactory.getLog(QRCodeServiceImpl.class);
    @Resource
    private QRCodeDao qrCodeDao;

    @Override
    public QRCode readByCode(String code) {
        return qrCodeDao.readByCode(code);
    }

    @Override
    public boolean verifyCode(String code) {
        QRCode qrCode = qrCodeDao.readByCode(code);
        LOG.info("-----------verify qr code-----------------");
        if (Objects.isNull(qrCode)) {
            return false;
        }
        LOG.info("code:" + qrCode.getCode() + ",status:" + qrCode.getStatus());
        Integer status = qrCode.getStatus();
        if (status == 1) {
            return false;
        }
        return true;
    }

    @Override
    @Transactional(TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public void updateQRCode(QRCode qrCode) {
        qrCodeDao.updateQRCode(qrCode);
    }
}
