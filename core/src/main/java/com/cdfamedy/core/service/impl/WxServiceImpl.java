package com.cdfamedy.core.service.impl;

import com.cdfamedy.core.WeiXinConstants;
import com.cdfamedy.core.service.WeixinService;
import com.cdfamedy.core.util.CommonUtils;
import com.cdfamedy.core.util.HttpUtil;
import com.cdfamedy.core.util.JsonUtil;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/23/2016.
 */
@Service
public class WxServiceImpl implements WeixinService {
    private String userInfoUrl = "http://weixin.cplotus.com/weixin/userinfo.ashx";
    private String vipUserInfoUrl = "http://weixin.cplotus.com/weixin/cmd.ashx";
    private String ticketUrl = "http://weixin.cplotus.com/weixin/jsapi_ticket.ashx";

    @Override
    public Map<String, Object> getUserInfo(String openId) {
        Map<String, Object> param = new HashMap<>();
        param.put("openid", openId);
        return sendRequest(param, userInfoUrl);
    }

    private Map<String, Object> getQueryStr(Map<String, Object> queryParam) {
        Map<String, Object> param = new HashMap<>();
        param.put("app_key", WeiXinConstants.APP_KEY);
        param.put("nonce", CommonUtils.getRandomStr());
        param.put("timestamp", CommonUtils.currentTimeStamp() + "");//将timestamp转为字符串
        param.put("stat_src", WeiXinConstants.STATIC_SRC);
        if (Objects.nonNull(queryParam)) {
            param.putAll(queryParam);
        }
        String tempStr = CommonUtils.getSortedStr(param);
        String signature = CommonUtils.md5Sign(tempStr, WeiXinConstants.APP_SECRET);
        param.put("queryStr", tempStr + "&sign=" + signature);
        return param;
    }

    @Override
    public Map<String, Object> getVipInfo(String openId) {
        Map<String, Object> param = new HashMap<>();
        param.put("openid", openId);
        param.put("cmd", "getvip");
        Map<String, Object> result = sendRequest(param, vipUserInfoUrl);
        return result;
    }

    private Map<String, Object> sendRequest(Map<String, Object> param, String url) {
        Map<String, Object> queryStr = getQueryStr(param);
        String responseStr = HttpUtil.doGet(url + "?" + queryStr.get("queryStr").toString());
        HashMap response = JsonUtil.fromJson(responseStr, HashMap.class);
        if (Objects.nonNull(response)) {
            response.putAll(queryStr);
        }
        return response;
    }

    @Override
    public Map<String, Object> getTicket() {
        return sendRequest(null, ticketUrl);
    }

    public static void main(String[] args) {
        WeixinService service = new WxServiceImpl();
        System.out.println(service.getVipInfo("o1Py0t7UnGihjJqCfZz2bigtkTu4"));
//        System.out.println(service.getTicket());
//        System.out.println(service.getUserInfo("o1Py0twT_6kpQRqIX4rJiQD_fjvQ"));//老段
        System.out.println(service.getUserInfo("o1Py0tx91UJXWdtT_gD9xMdI5Rdo"));//jackie
      /*  Map<String, Object> param = new HashMap<>();
        param.put("timeStamp", "1461661208969");
        param.put("package", "prepay_id=wx201604261702421622b1c4a10329035995");
        param.put("appId", "wx937fba8914a5d9a9");
        param.put("signType", "MD5");
        param.put("nonceStr", "by5nuz586mxvu5bfd2qcsfpk016xe90h");
        String sortedStr = CommonUtils.getSortedStr(param);
        System.out.println(sortedStr.equals("appId=wx937fba8914a5d9a9&nonceStr=by5nuz586mxvu5bfd2qcsfpk016xe90h&package=prepay_id=wx201604261702421622b1c4a10329035995&signType=MD5&timeStamp=1461661208969"));
        String appSecret = "1FDD78A7B584F48B194CAEE2D035D6B3";
        String signature = CommonUtils.md5Sign(sortedStr, appSecret,"key");
        System.out.println(signature.toUpperCase());
        System.out.println(signature.toUpperCase().equals("1E21B56B86D5922A03E58464391477F2"));*/

    }
}
