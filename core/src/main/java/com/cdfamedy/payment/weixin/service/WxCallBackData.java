package com.cdfamedy.payment.weixin.service;

/**
 * Created by jackie on 5/8/2016.
 */
public class WxCallBackData {
    public static final String SUCCESS="SUCCESS";
    public static final String NOTPAY="NOTPAY";
    private String transaction_id;
    private String nonce_str;
    private String bank_type;
    private String openid;
    private String sign;
    private String fee_type;
    private String mch_id;
    private String cash_fee;
    private String out_trade_no;
    private String appid;
    private String total_fee;
    private String trade_type;
    private String result_code;
    private String time_end;
    private String is_subscribe;
    private String return_code;
    private String trade_state;

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getBank_type() {
        return bank_type;
    }

    public void setBank_type(String bank_type) {
        this.bank_type = bank_type;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getCash_fee() {
        return cash_fee;
    }

    public void setCash_fee(String cash_fee) {
        this.cash_fee = cash_fee;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(String total_fee) {
        this.total_fee = total_fee;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getResult_code() {
        return result_code;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public String getIs_subscribe() {
        return is_subscribe;
    }

    public void setIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
    }

    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getTrade_state() {
        return trade_state;
    }

    public void setTrade_state(String trade_state) {
        this.trade_state = trade_state;
    }

    @Override
    public String toString() {
        return "WxCallBackData{" +
                "transaction_id='" + transaction_id + '\'' +
                ", nonce_str='" + nonce_str + '\'' +
                ", bank_type='" + bank_type + '\'' +
                ", openid='" + openid + '\'' +
                ", sign='" + sign + '\'' +
                ", fee_type='" + fee_type + '\'' +
                ", mch_id='" + mch_id + '\'' +
                ", cash_fee='" + cash_fee + '\'' +
                ", out_trade_no='" + out_trade_no + '\'' +
                ", appid='" + appid + '\'' +
                ", total_fee='" + total_fee + '\'' +
                ", trade_type='" + trade_type + '\'' +
                ", result_code='" + result_code + '\'' +
                ", time_end='" + time_end + '\'' +
                ", is_subscribe='" + is_subscribe + '\'' +
                ", return_code='" + return_code + '\'' +
                ", trade_state='" + trade_state + '\'' +
                '}';
    }
}
