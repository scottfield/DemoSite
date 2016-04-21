package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.QRCode;
import com.mycompany.sample.dao.QRCodeDao;
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
    @Resource
    private QRCodeDao qrCodeDao;

    @Override
    public QRCode readByCode(String code) {
        return qrCodeDao.readByCode(code);
    }

    @Override
    public boolean verifyCode(String code) {
        QRCode qrCode = qrCodeDao.readByCode(code);
        if (Objects.isNull(qrCode)) {
            return false;
        }
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
