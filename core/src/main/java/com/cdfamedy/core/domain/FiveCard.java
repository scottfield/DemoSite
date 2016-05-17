package com.cdfamedy.core.domain;

/**
 * Created by jackie on 4/23/2016.
 */
public interface FiveCard {
    //五折卡状态
    Boolean CARD_STATUS_INACTIVE = false;
    Boolean CARD_STATUS_ACTIVE = true;
    //五折卡类型
    Integer CARD_TYPE_A = 0;
    Integer CARD_TYPE_B = 1;

    Integer getId();

    void setId(Integer id);

    String getName();

    void setName(String name);

    String getDesc();

    void setDesc(String desc);

    Integer getType();

    void setType(Integer type);

    String getNo();

    void setNo(String no);

    Boolean getStatus();

    void setStatus(Boolean status);

    CustomerFiveCardXref getFiveCardXrefs();

    void setFiveCardXrefs(CustomerFiveCardXref fiveCardXrefs);
}
