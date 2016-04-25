package com.mycompany.sample.service;

import com.mycompany.sample.core.WeiXinConstants;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.HttpUtil;
import com.mycompany.sample.util.JsonHelper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/23/2016.
 */
@Service
public class WeixinServiceImpl implements WeixinService {
    @Override
    public Map<String, Object> getUserInfo(String openId) {
        Map<String, Object> param = new HashMap<>();
        param.put("openid", openId);
        return sendRequest(param, "http://weixin.cplotus.com/weixin/userinfo.ashx");
    }

    private Map<String, Object> getQueryStr(Map<String, Object> extraParam) {
        Map<String, Object> param = new HashMap<>();
        param.put("app_key", WeiXinConstants.APP_KEY);
        param.put("nonce", CommonUtils.getRandomStr());
        param.put("timestamp", CommonUtils.currentTimeStamp());
        param.put("stat_src", WeiXinConstants.STATIC_SRC);
        if (Objects.nonNull(extraParam)) {
            param.putAll(extraParam);
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
        Map<String, Object> result = sendRequest(param, "http://weixin.cplotus.com/weixin/cmd.ashx");
        return result;
    }

    private Map<String, Object> sendRequest(Map<String, Object> extraParam, String url) {
        Map<String, Object> queryStr = getQueryStr(extraParam);
        String responseStr = HttpUtil.sendGet(url, (String) queryStr.get("queryStr"));
        HashMap response = JsonHelper.toObject(responseStr, HashMap.class);
        if (Objects.nonNull(response)) {
            response.putAll(queryStr);
        }
        return response;
    }

    @Override
    public Map<String, Object> getTicket() {
        return sendRequest(null, "http://weixin.cplotus.com/weixin/jsapi_ticket.ashx");
    }

    public static void main(String[] args) {
        WeixinService service = new WeixinServiceImpl();
//        System.out.println(service.getVipInfo("o1Py0t7UnGihjJqCfZz2bigtkTu4"));
//        System.out.println(service.getTicket());
        System.out.println(service.getUserInfo("o1Py0t7UnGihjJqCfZz2bigtkTu4"));
    }
}
