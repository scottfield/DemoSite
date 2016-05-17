package com.cdfamedy.core.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

/**
 * Created by jackie on 4/13/2016.
 */
public interface CustomProduct extends Product {
    void setSales(Integer sales);

    Integer getSales();
    Integer getLimit();

    void setLimit(Integer limit);
    String getDepartment();

    void setDepartment(String department);

    String getSku();

    void setSku(String sku);

    String getStyle();

    void setStyle(String style);
}
