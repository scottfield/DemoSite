package com.cdfamedy.dao;

import com.cdfamedy.core.catalog.domain.FiveCard;

import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
public interface FiveCardDao {
    FiveCard readById(Integer id);

    List<FiveCard> readAllFiveCard();

    void saveFiveCard(FiveCard fiveCard);

    FiveCard readByStatusAndType(Boolean status, Integer type);
    Long getAvailableFiveCardQuantity(Integer type);
    Long getTotalFiveCardQuantityByType(Integer type);

}
