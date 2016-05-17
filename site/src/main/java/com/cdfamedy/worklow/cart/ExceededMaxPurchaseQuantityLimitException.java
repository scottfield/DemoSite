package com.cdfamedy.worklow.cart;

/**
 * Created by jackie on 5/4/2016.
 */
public class ExceededMaxPurchaseQuantityLimitException extends Exception {
    private Long productId;
    private Integer maxQuantityLimit;
    private Integer quantityRrequested;

    public ExceededMaxPurchaseQuantityLimitException(Long productId, Integer maxQuantityLimit, Integer quantityRrequested) {
        super();
        this.productId = productId;
        this.maxQuantityLimit = maxQuantityLimit;
        this.quantityRrequested = quantityRrequested;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Integer getMaxQuantityLimit() {
        return maxQuantityLimit;
    }

    public void setMaxQuantityLimit(Integer maxQuantityLimit) {
        this.maxQuantityLimit = maxQuantityLimit;
    }

    public Integer getQuantityRrequested() {
        return quantityRrequested;
    }

    public void setQuantityRrequested(Integer quantityRrequested) {
        this.quantityRrequested = quantityRrequested;
    }
}
