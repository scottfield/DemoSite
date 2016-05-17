package com.cdfamedy.core.dao.payment.weixin.common;

import com.cdfamedy.core.domain.ShopAccount;
import com.cdfamedy.core.domain.impl.ShopAccountImpl;

import java.util.HashMap;
import java.util.Map;

/**
 * 商户支付配置参数
 */
public class WxConfiguration {
    //门店与商户对照表
    public static Map<String, ShopAccount> accountMap = new HashMap<>();

    //模拟数据,正式环境下会从数据库中预先读取
    static {
        //三元里
        ShopAccount sanyuanli = new ShopAccountImpl();
        sanyuanli.setMchid("10010514");
        sanyuanli.setKey("xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ");
        sanyuanli.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        sanyuanli.setAppid("wx937fba8914a5d9a9");
        accountMap.put("10010514", sanyuanli);
        //潮州
        ShopAccount chaozhou = new ShopAccountImpl();
        chaozhou.setMchid("1281842701");
        chaozhou.setKey("A534585E7E4B969A516B0F29B8281410");
        chaozhou.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        chaozhou.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1281842701", chaozhou);
        //天山
        ShopAccount tianshan = new ShopAccountImpl();
        tianshan.setMchid("1282294601");
        tianshan.setKey("BF544FA7E4F635FB27FB0770E838104F");
        tianshan.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        tianshan.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1282294601", tianshan);
        //揭阳
        ShopAccount jieyang = new ShopAccountImpl();
        jieyang.setMchid("1281813501");
        jieyang.setKey("B5B742BCBE7FD36B4A49F2C2C779D283");
        jieyang.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        jieyang.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1281813501", jieyang);
        //中信店
        ShopAccount zhongxin = new ShopAccountImpl();
        zhongxin.setMchid("1282217901");
        zhongxin.setKey("864CF9E6E0EF325F3C7FC52A7F27A73A");
        zhongxin.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        zhongxin.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1282217901", zhongxin);
        //怡丰城店
        ShopAccount yifeng = new ShopAccountImpl();
        yifeng.setMchid("1282278301");
        yifeng.setKey("8145A32DA48DB24FFDE9BAB17164E8DD");
        yifeng.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        yifeng.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1282278301", yifeng);
        //金平
        ShopAccount jinping = new ShopAccountImpl();
        jinping.setMchid("1281874701");
        jinping.setKey("F85D211FB0FE8CA8464EDC046C995D57");
        jinping.setAppsecret("1974155fda854243a2a4b08c2928bf92");
        jinping.setAppid("wx937fba8914a5d9a9");
        accountMap.put("1281874701", jinping);


    }

    public static String getKey(String mchid) {
        return accountMap.get(mchid).getKey();
    }

    //以下是几个API的路径：
    //0) 统一下单
    public static String UNIFIED_ORDER_API = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    //1）被扫支付API
    public static String PAY_API = "https://api.mch.weixin.qq.com/pay/micropay";

    //2）被扫支付查询API
    public static String PAY_QUERY_API = "https://api.mch.weixin.qq.com/pay/orderquery";

    //3）退款API
    public static String REFUND_API = "https://api.mch.weixin.qq.com/secapi/pay/refund";

    //4）退款查询API
    public static String REFUND_QUERY_API = "https://api.mch.weixin.qq.com/pay/refundquery";

    //5）撤销API
    public static String REVERSE_API = "https://api.mch.weixin.qq.com/secapi/pay/reverse";

    //6）下载对账单API
    public static String DOWNLOAD_BILL_API = "https://api.mch.weixin.qq.com/pay/downloadbill";

    //7) 统计上报API
    public static String REPORT_API = "https://api.mch.weixin.qq.com/payitil/report";
}
