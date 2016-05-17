package com.cdfamedy.core.domain.impl;

import com.cdfamedy.core.domain.CustomProduct;
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

    @AdminPresentation(friendlyName = "CustomProductImpl_Product_Sale_Limit", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General)
    @Column(name = "sale_limit")
    private Integer limit;
    @AdminPresentation(friendlyName = "CustomProductImpl_Product_Department", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General)
    @Column(name = "product_department")
    private String department;
    @AdminPresentation(friendlyName = "CustomProductImpl_Product_Style", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General)
    @Column(name = "product_style")
    private String style;
    @AdminPresentation(friendlyName = "CustomProductImpl_Product_Sku", order = 2000,
            group = Presentation.Group.Name.General, groupOrder = Presentation.Group.Order.General)
    @Column(name = "product_sku")
    private String sku;
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

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
