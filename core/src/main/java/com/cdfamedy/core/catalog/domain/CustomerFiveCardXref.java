package com.cdfamedy.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.Customer;

import java.util.Date;
import java.util.List;

/**
 * Created by jackie on 4/23/2016.
 */
public interface CustomerFiveCardXref {
    Integer getId();

    void setId(Integer id);

    Customer getCustomer();

    void setCustomer(Customer customer);

    FiveCard getFiveCard();

    void setFiveCard(FiveCard fiveCard);

    Boolean getStatus();

    void setStatus(Boolean status);

    Customer getReferer();

    void setReferer(Customer referer);

    Integer getType();

    void setType(Integer type);

    Date getCreateDate();

    void setCreateDate(Date createDate);

    Date getActiveDate();

    void setActiveDate(Date activeDate);
    List<CustomerFiveCardXref> getSharedCardXrefs();

    void setSharedCardXrefs(List<CustomerFiveCardXref> sharedCardXrefs);
    Boolean getShowDialog();

    void setShowDialog(Boolean showDialog);
}
