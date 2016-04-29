package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.FiveCard;
import com.mycompany.sample.dao.FiveCardDao;
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
}
