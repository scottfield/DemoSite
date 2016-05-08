package com.mycompany.controller.wrapper;

/**
 * Created by jackie on 4/27/2016.
 */
public class CardWrapper {
    public static final Integer FIVE_CARD_TYPE = 0;
    public static final Integer COUPON_TYPE = 1;

    private Integer type;
    private Integer value;
    private Boolean status;
    private String cardNo;
    private Long id;
    private String description;
    private Integer couponType;

    private CardWrapper() {
    }

    public static CardWrapper getInstance() {
        CardWrapper wrapper = new CardWrapper();
        return wrapper;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {

        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCouponType() {
        return couponType;
    }

    public void setCouponType(Integer couponType) {
        this.couponType = couponType;
    }
}
