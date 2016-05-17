package com.cdfamedy.core.service.impl;

import com.cdfamedy.core.dao.FiveCardDao;
import com.cdfamedy.core.domain.FiveCard;
import com.cdfamedy.core.service.FiveCardService;
import org.broadleafcommerce.common.util.TransactionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
@Service("fiveCardService")
public class FiveCardServiceImpl implements FiveCardService {
    @Resource(name = "fiveCardDao")
    private FiveCardDao fiveCardDao;

    @Override
    public FiveCard readById(Integer id) {
        return fiveCardDao.readById(id);
    }

    @Override
    public List<FiveCard> readAllFiveCard() {
        return fiveCardDao.readAllFiveCard();
    }

    @Override
    @Transactional(TransactionUtils.DEFAULT_TRANSACTION_MANAGER)
    public void saveFiveCard(FiveCard fiveCard) {
        fiveCardDao.saveFiveCard(fiveCard);
    }

    @Override
    public FiveCard readByStatusAndType(Boolean status, Integer type) {
        return fiveCardDao.readByStatusAndType(status, type);
    }

    @Override
    public Long getAvailableFiveCardQuantity(Integer type) {
        return fiveCardDao.getAvailableFiveCardQuantity(type);
    }

    @Override
    public Long getTotalFiveCardQuantityByType(Integer type) {
        return fiveCardDao.getTotalFiveCardQuantityByType(type);
    }
}
