package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.core.catalog.domain.ProductImpl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by jackie on 4/13/2016.
 */
@Entity
@Table(name = "PRODUCT_EXTEND")
public class CustomProductImpl extends ProductImpl implements CustomProduct {
    @AdminPresentation(friendlyName = "CustomProductImpl_Product_PromoMessage", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General)
    @Column(name = "PROMOTION_MESSAGE")
    private String promoMessage = "";

    @AdminPresentation(friendlyName = "CustomProductImpl_Product_Sales", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General,
            excluded = true)
    @Column(name = "SALES")
    private Integer sales = 0;

    @Override
    public String getPromoMessage() {
        return promoMessage;
    }

    @Override
    public void setPromoMessage(String promoMessage) {
        this.promoMessage = promoMessage;
    }

    @Override
    public void setSales(Integer sales) {
        this.sales = sales;
    }

    @Override
    public Integer getSales() {
        return sales < 0 ? 0 : sales;
    }
}
