package com.cdfamedy.core.catalog.domain;

import java.util.Date;

/**
 * Created by jackie on 4/25/2016.\
 * 促销活动
 */
public interface Promotion {
    int NOT_START =-1;
    int IN_PROCESS =0;
    int END = 1;
    Date getStartDate();

    void setStartDate(Date startDate);

    Date getEndDate();

    void setEndDate(Date endDate);

    int getStatus();
}
