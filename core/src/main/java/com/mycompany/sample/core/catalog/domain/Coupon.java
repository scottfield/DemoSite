package com.mycompany.sample.core.catalog.domain;

import java.util.Date;

/**
 * Created by jackie on 4/27/2016.
 */
public interface Coupon {
    Integer TYPE_A = 0;
    Integer TYPE_B = 1;
    Integer TYPE_C = 2;
    Integer TYPE_D = 3;
    Integer TYPE_E = 4;
    Integer TYPE_F = 5;
    Integer getAmount();

    void setAmount(Integer amount);

    Long getId();

    void setId(Long id);

    Integer getType();

    void setType(Integer type);

    Date getUpdatedOn();

    void setUpdatedOn(Date updatedOn);

    Integer getValue();

    void setValue(Integer value);
    Date getCreatedOn();

    void setCreatedOn(Date createdOn);
}
