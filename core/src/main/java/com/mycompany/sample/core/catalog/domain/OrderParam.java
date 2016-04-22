package com.mycompany.sample.core.catalog.domain;

import com.mycompany.sample.util.CommonUtils;
import org.broadleafcommerce.core.order.domain.Order;

import java.io.PipedReader;

/**
 * Created by jackie on 4/22/2016.
 */
public class OrderParam {
    private String body;
    private String attach;
    private String outTradeNo;
    private String totalFee;
    private String timeStart;
    private String timeExpire;
    private String goodsTag;
    private String notifyUrl;
    private String tradeType;
    private String openId;
    private String appId;
    private String mchid;
    private String spbillCreateIp;
    private String nonce;


    private OrderParam() {

    }

    public static OrderParam getInstance(Order order) {
        OrderParam param = new OrderParam();
        param.setOpenId(order.getCustomer().getUsername());
        param.setNotifyUrl("");
        param.setTradeType("JSAPI");
        param.setTimeStart(CommonUtils.currentDate());
        param.setTimeExpire(CommonUtils.expireDate());
        param.setOutTradeNo(order.getOrderNumber());
        param.setTotalFee(order.getTotal().toString());
        param.setAttach("test attach");
        param.setBody("test body");
        param.setGoodsTag("test goods tag");
        Shop shop = ((CustomAddress) (order.getCustomer().getCustomerAddresses().get(0))).getShop();
        param.setMchid(shop.getMchid());
        param.setAppId(shop.getAppId());
        param.setNonce(CommonUtils.getRandomStr());
        return param;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(String totalFee) {
        this.totalFee = totalFee;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeExpire() {
        return timeExpire;
    }

    public void setTimeExpire(String timeExpire) {
        this.timeExpire = timeExpire;
    }

    public String getGoodsTag() {
        return goodsTag;
    }

    public void setGoodsTag(String goodsTag) {
        this.goodsTag = goodsTag;
    }

    public String getNotifyUrl() {
        return notifyUrl;
    }

    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }

    public String getTradeType() {
        return tradeType;
    }

    public void setTradeType(String tradeType) {
        this.tradeType = tradeType;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getMchid() {
        return mchid;
    }

    public void setMchid(String mchid) {
        this.mchid = mchid;
    }

    public String getSpbillCreateIp() {
        return spbillCreateIp;
    }

    public void setSpbillCreateIp(String spbillCreateIp) {
        this.spbillCreateIp = spbillCreateIp;
    }

    public String getNonce() {
        return nonce;
    }

    public void setNonce(String nonce) {
        this.nonce = nonce;
    }
}
