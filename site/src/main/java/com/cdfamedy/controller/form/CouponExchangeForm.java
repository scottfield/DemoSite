package com.cdfamedy.controller.form;

/**
 * Created by jackie on 4/20/2016.
 */
public class CouponExchangeForm {
    private String reciever;
    private Long orderId;
    private String recieverPhone;
    private String verifyCode;
    private Long couponXrefId;

    public String getReciever() {
        return reciever;
    }

    public void setReciever(String reciever) {
        this.reciever = reciever;
    }

    public String getRecieverPhone() {
        return recieverPhone;
    }

    public void setRecieverPhone(String recieverPhone) {
        this.recieverPhone = recieverPhone;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public Long getCouponXrefId() {
        return couponXrefId;
    }

    public void setCouponXrefId(Long couponXrefId) {
        this.couponXrefId = couponXrefId;
    }
}
