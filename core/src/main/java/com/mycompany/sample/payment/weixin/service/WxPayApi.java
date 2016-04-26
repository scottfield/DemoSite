package com.mycompany.sample.payment.weixin.service;

import com.mycompany.sample.payment.weixin.common.Configure;
import com.mycompany.sample.payment.weixin.common.HttpService;
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.common.XMLParser;
import com.mycompany.sample.payment.weixin.protocol.UnifiedOrderReqData;
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
        String appid = "wx937fba8914a5d9a9";
        String mch_id = "10010514";
        String body = "test";
        String out_trade_no = "42254455";
        String spbill_create_ip = "192.168.2.1";
        String notify_url = "http://discount.lzzyad.com";
        String trade_type = "JSAPI";
        String openId = "o1Py0tx91UJXWdtT_gD9xMdI5Rdo";
        Integer total_fee = 1;
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.UnifiedOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, notify_url, trade_type).setOpenid(openId).build();
        System.out.println(UnifiedOrder(reqData));
    }
}
