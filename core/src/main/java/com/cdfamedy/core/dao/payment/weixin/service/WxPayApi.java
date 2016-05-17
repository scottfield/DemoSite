package com.cdfamedy.core.dao.payment.weixin.service;

import com.cdfamedy.core.dao.payment.weixin.common.Configure;
import com.cdfamedy.core.dao.payment.weixin.common.HttpService;
import com.cdfamedy.core.dao.payment.weixin.common.JsonUtil;
import com.cdfamedy.core.dao.payment.weixin.common.XMLParser;
import com.cdfamedy.core.dao.payment.weixin.protocol.QueryOrderReqData;
import com.cdfamedy.core.dao.payment.weixin.protocol.UnifiedOrderReqData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hupeng on 2015/7/28.
 */
public class WxPayApi {

    private static Log logger = LogFactory.getLog(WxPayApi.class);

    public static Map<String, Object> UnifiedOrder(UnifiedOrderReqData reqData) throws IOException, SAXException, ParserConfigurationException {
        String res = HttpService.doPost(Configure.UNIFIED_ORDER_API, reqData);
        logger.debug("UnifiedOrder get response:" + res);
        return XMLParser.getMapFromXML(res);
    }

    public static Map<String, Object> queryOrder(QueryOrderReqData reqData) throws IOException, SAXException, ParserConfigurationException {
        String res = HttpService.doPost(Configure.PAY_QUERY_API, reqData);
        logger.debug("Pay Query get response:" + res);
        return XMLParser.getMapFromXML(res);
    }

    public static String getOpenid(String appid, String appSecret, String code) throws Exception {
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
                + appid
                + "&secret="
                + appSecret
                + "&code=" + code + "&grant_type=authorization_code";
        String res = HttpService.doGet(requestUrl);
        System.out.println(res);
        Map<String, Object> resultMap = JsonUtil.fromJson(res, HashMap.class);
        if (resultMap.get("openid") == null) {
            return null;
        }

        return resultMap.get("openid").toString();
    }

    public static void main(String[] args) throws Exception {
/*      String appid = "wx937fba8914a5d9a9";
        String mch_id = "10010514";
        String body = "测试支付";
        String out_trade_no = "4ds2254455";
        String spbill_create_ip = "192.168.2.1";
//        String notify_url = "http://discount.lzzyad.com";
        String notify_url = "http://localhost:8080/wechatpay/index/notify";
        String trade_type = "JSAPI";
        String openId = "o1Py0tx91UJXWdtT_gD9xMdI5Rdo";
        Integer total_fee = 1;
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.QueryOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, notify_url, trade_type).setOpenid(openId).build();
        System.out.println(UnifiedOrder(reqData));
        String querystr = "appid=wx937fba8914a5d9a9&body=测试支付&mch_id=10010514&nonce_str=w9bwkoz06iwss827vzvxqm1yo5a4eo74&notify_url=http://localhost:8080/wechatpay/index/notify&openid=o1Py0tx91UJXWdtT_gD9xMdI5Rdo&out_trade_no=201605031734252982703&spbill_create_ip=127.0.0.1&total_fee=1&trade_type=JSAPI&key=xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ";
        String s = DigestUtils.md5Hex(querystr);
        System.out.println(s.toUpperCase());*/
//        查询账单
        String appid = "wx937fba8914a5d9a9";


        String mch_id = "1282294601";
        String out_trade_no = "201605092339076556752";


        QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(appid).setMch_id(mch_id).setOut_trade_no(out_trade_no).build();
        Map<String, Object> stringObjectMap = queryOrder(reqData);
        System.out.println(stringObjectMap);
//        WxCallBackData callBackData = JsonUtil.fromJson(JsonHelper.toJsonStr(stringObjectMap), WxCallBackData.class);
//        System.out.println("SUCCESS".equals(callBackData.getTrade_state()));
//        System.out.println(JsonHelper.toJsonStr(stringObjectMap));

       /* String result = "<xml><appid><![CDATA[wx937fba8914a5d9a9]]></appid><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1326016401]]></mch_id><nonce_str><![CDATA[5qg7pmgbrai2v30g8n0t8xr6ggtw2ri8]]></nonce_str><openid><![CDATA[o1Py0tx91UJXWdtT_gD9xMdI5Rdo]]></openid><out_trade_no><![CDATA[20160508212400943851]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[8F3173CFE9E3495B55E2AACC40C0F26F]]></sign><time_end><![CDATA[20160508212409]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4006002001201605085647871490]]></transaction_id></xml>";

        Map<String, Object> mapFromXML = XMLParser.getMapFromXML(result);
        System.out.println(JsonHelper.toJsonStr(mapFromXML));*/
    }
}
