package com.cdfamedy.core.dao.payment.weixin.protocol;


import com.cdfamedy.core.dao.payment.weixin.common.Signature;
import com.cdfamedy.core.util.CommonUtils;
import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

@XStreamAlias("xml")
public class QueryOrderReqData {

    private String appid;
    private String mch_id;
    private String nonce_str;
    private String sign;
    private String out_trade_no;

    private QueryOrderReqData(QueryOrderReqDataBuilder builder) {
        this.appid = builder.appid;
        this.mch_id = builder.mch_id;
        this.nonce_str = CommonUtils.getRandomStr();
        this.out_trade_no = builder.out_trade_no;
        this.sign = Signature.getSign(toMap(), mch_id);
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<String, Object>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (Field field : fields) {
            Object obj;
            try {
                obj = field.get(this);
                if (obj != null) {
                    map.put(field.getName(), obj);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }


    public static class QueryOrderReqDataBuilder {
        private String appid;
        private String mch_id;
        private String out_trade_no;
        private String openid;

        public QueryOrderReqDataBuilder() {
        }

        public QueryOrderReqDataBuilder setAppid(String appid) {
            this.appid = appid;
            return this;
        }

        public QueryOrderReqDataBuilder setMch_id(String mch_id) {
            this.mch_id = mch_id;
            return this;
        }

        public QueryOrderReqDataBuilder setOut_trade_no(String out_trade_no) {
            this.out_trade_no = out_trade_no;
            return this;
        }

        public QueryOrderReqData build() {
            return new QueryOrderReqData(this);
        }
    }


}
