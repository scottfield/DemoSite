package com.mycompany.sample.payment.weixin.common;

import com.mycompany.sample.core.catalog.domain.ShopAccount;
import com.mycompany.sample.core.catalog.domain.ShopAccountImpl;

import java.util.HashMap;
import java.util.Map;

/**
 * 商户支付配置参数
 */
public class Configure {


    //这个就是自己要保管好的私有Key了（切记只能放在自己的后台代码里，不能放在任何可能被看到源代码的客户端程序中）
    // 每次自己Post数据给API的时候都要用这个key来对所有字段进行签名，生成的签名会放在Sign这个字段，API收到Post数据的时候也会用同样的签名算法对Post过来的数据进行签名和验证
    // 收到API的返回的时候也要用这个key来对返回的数据算下签名，跟API的Sign数据进行比较，如果值不一致，有可能数据被第三方给篡改

    //门店与商户对照表
    public static Map<String, ShopAccount> accountMap = new HashMap<>();
    //mock data
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

    private static String key = "562d8ba6bf2bc562d8ba6bf337562d8b";

    //微信分配的公众号ID（开通公众号之后可以获取到）
    private static String appID = "";

    private static String appSecret = "";

    //微信支付分配的商户号ID（开通公众号的微信支付功能之后可以获取到）
    private static String mchID = "";

    //受理模式下给子商户分配的子商户号
    private static String subMchID = "";

    //HTTPS证书的本地路径
    private static String certLocalPath = "";

    //HTTPS证书密码，默认密码等于商户号MCHID
    private static String certPassword = "";

    //是否使用异步线程的方式来上报API测速，默认为异步模式
    private static boolean useThreadToDoReport = true;

    //机器IP
    private static String ip = "";

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

    public static boolean isUseThreadToDoReport() {
        return useThreadToDoReport;
    }

    public static void setUseThreadToDoReport(boolean useThreadToDoReport) {
        Configure.useThreadToDoReport = useThreadToDoReport;
    }

    public static String HttpsRequestClassName = "com.tencent.common.HttpsRequest";

    public static void setKey(String key) {
        Configure.key = key;
    }

    public static void setAppID(String appID) {
        Configure.appID = appID;
    }

    public static void setAppSecret(String appSecret) {
        Configure.appSecret = appSecret;
    }

    public static void setMchID(String mchID) {
        Configure.mchID = mchID;
    }

    public static void setSubMchID(String subMchID) {
        Configure.subMchID = subMchID;
    }

    public static void setCertLocalPath(String certLocalPath) {
        Configure.certLocalPath = certLocalPath;
    }

    public static void setCertPassword(String certPassword) {
        Configure.certPassword = certPassword;
    }

    public static void setIp(String ip) {
        Configure.ip = ip;
    }

    public static String getKey(String mchid) {
        return accountMap.get(mchid).getKey();
    }

    public static String getAppid() {
        return appID;
    }

    public static String getAppSecret() {
        return appSecret;
    }

    public static String getMchid() {        return mchID;
    }

    public static String getSubMchid() {
        return subMchID;
    }

    public static String getCertLocalPath() {
        return certLocalPath;
    }

    public static String getCertPassword() {
        return certPassword;
    }

    public static String getIP() {
        return ip;
    }

    public static void setHttpsRequestClassName(String name) {
        HttpsRequestClassName = name;
    }


}
