package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.FiveCard;

import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
public interface FiveCardService {
    FiveCard readById(Integer id);

    List<FiveCard> readAllFiveCard();

    void saveFiveCard(FiveCard fiveCard);

    FiveCard readByStatusAndType(Boolean status, Integer type);

    /**
     * 获取对应类型五折卡可用数量
     * @param type 五折卡类型
     * @return
     */
    Long getAvailableFiveCardQuantity(Integer type);

    /**
     * 根据五折卡类型获取总五折卡总量
     * @param type
     * @return
     */
    Long getTotalFiveCardQuantityByType(Integer type);
}
