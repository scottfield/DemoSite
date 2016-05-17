package com.cdfamedy.core.domain;

import org.broadleafcommerce.profile.core.domain.Customer;

import java.util.Date;

/**
 * Created by jackie on 4/21/2016.
 */
public interface QRCode {
    Integer getId();

    void setId(Integer id);

    Integer getStatus();

    void setStatus(Integer status);

    Date getUsedate();

    void setUsedate(Date usedate);

    Customer getCustomer();

    void setCustomer(Customer usedby);

    String getCode();

    void setCode(String code);
}
