package com.mycompany.api.endpoint.wrapper;

import com.mycompany.sample.core.catalog.domain.CustomProduct;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.web.api.wrapper.ProductWrapper;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by jackie on 5/1/2016.
 */
@XmlRootElement(name = "product")
@XmlAccessorType(value = XmlAccessType.FIELD)
public class CustomProductWrapper extends ProductWrapper {
    @XmlElement
    private Integer sales;
    @XmlElement
    private Integer quantityAvailable;
    @XmlElement
    private Integer saleLimit;
    @XmlElement
    private Boolean isFeaturedProduct;

    @Override
    public void wrapSummary(Product model, HttpServletRequest request) {
        super.wrapSummary(model, request);
        CustomProduct product = (CustomProduct) model;
        this.sales = product.getSales();
        this.quantityAvailable = product.getDefaultSku().getQuantityAvailable();
        this.saleLimit = product.getLimit();
        this.isFeaturedProduct = product.isFeaturedProduct();
    }
}
