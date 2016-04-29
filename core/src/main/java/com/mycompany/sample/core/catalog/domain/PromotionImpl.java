package com.mycompany.sample.core.catalog.domain;

import java.util.Date;

/**
 * Created by jackie on 4/25/2016.
 */
public class PromotionImpl implements Promotion {
    private Date startDate;
    private Date endDate;

    public PromotionImpl() {
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public int getStatus() {
        Date now = new Date();
        if (now.before(startDate)) {
            return Promotion.NOT_START;
        } else if (now.after(endDate))
            return Promotion.END;
        return Promotion.IN_PROCESS;
    }
}
