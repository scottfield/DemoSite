package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.FiveCard;

import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
public interface FiveCardService {
    FiveCard readById(Integer id);

    List<FiveCard> readAllFiveCard();

    void saveFiveCard(FiveCard fiveCard);

    FiveCard readByStatusAndType(Boolean status, Integer type);
}
