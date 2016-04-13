package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

/**
 * Created by jackie on 4/13/2016.
 */
public interface CustomProduct extends Product {
    void setSales(Integer sales);

    Integer getSales();
}
