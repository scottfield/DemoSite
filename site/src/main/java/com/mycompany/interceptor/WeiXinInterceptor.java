package com.mycompany.interceptor;

import com.mycompany.sample.util.CommonUtils;
import com.mycompany.util.HttpUtil;
import com.mycompany.util.JsonHelper;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Objects;

/**
 * Created by jackie on 4/21/2016.
 */
public class WeiXinInterceptor implements HandlerInterceptor {
    private String staticSrc;
    private String appKey;
    private String appSecret;
    private String appId;
    private static final String SALT = new Date().toString();
    private static final Md5PasswordEncoder MD5_ENCODER = new Md5PasswordEncoder();
    private static final ShaPasswordEncoder SHA_ENCODER = new ShaPasswordEncoder();
    private volatile static int count = 0;
    private static final int maxTry = 3;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        ServletContext servletContext = request.getSession().getServletContext();
        //检测application域中是否存在ticket
        Object ticket = servletContext.getAttribute("ticketMap");
        if (Objects.nonNull(ticket)) {
            HashMap<String, Object> ticketMap = (HashMap) ticket;
            Integer expiresIn = (Integer) ticketMap.get("expires_in");
            long time = (long) ticketMap.get("timestamp");
            long beforeDate = time + expiresIn * 1000;
            long now = new Date().getTime();
            //检测ticket是否过期
            if (beforeDate >= now) {
                return true;
            }
        }
        //生成新的ticket并存入application中
        ticket = generateTicket();
        servletContext.setAttribute("ticketMap", ticket);
        return true;
    }

    private synchronized HashMap generateTicket() {
        Date generateDate = new Date();
        long timestamp = generateDate.getTime();
        String nonce = CommonUtils.getRandomStr();
        String queryStr = "app_key=" + appKey + "&nonce=" + nonce + "&stat_src=" + staticSrc + "&timestamp=" + timestamp;
        String tempStr = queryStr + "&app_secret=" + appSecret;
        String sign = MD5_ENCODER.encodePassword(tempStr, null);
        String url = "http://weixin.cplotus.com/weixin/jsapi_ticket.ashx?" + queryStr + "&sign=" + sign;
        String result = HttpUtil.sendGet(url, null);
        HashMap ticket = JsonHelper.toObject(result, HashMap.class);
        if (ticket.get("errcode").equals(0)) {
            ticket.put("timestamp", timestamp);
            ticket.put("nonce", nonce);
            ticket.put("generateDate", generateDate);
            ticket.put("appId", appId);
        } else {
            //尝试多次获取ticket
            if (count < maxTry) {
                generateTicket();
                count++;
            } else {

                throw new RuntimeException("生成ticket失败,详细信息：" + ticket.toString());
            }
        }
        return ticket;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        ServletContext servletContext = request.getSession().getServletContext();
        HashMap<String, Object> ticketMap = (HashMap<String, Object>) servletContext.getAttribute("ticketMap");
        String nonce = (String) ticketMap.get("nonce");
        long timestamp = (long) ticketMap.get("timestamp");
        String ticket = (String) ticketMap.get("ticket");
        String url = request.getRequestURL().toString();

        String tempStr = "jsapi_ticket=" + ticket + "&noncestr=" + nonce + "&timestamp=" + timestamp + "&url=" + url;
        //生成签名
        String signature = DigestUtils.sha1Hex(tempStr);

        ticketMap.put("signature", signature);
        request.setAttribute("ticketMap", ticketMap);
        //分享相关
        request.setAttribute("shareTitle", "分享到朋友圈");
        request.setAttribute("shareDesc", "分享到朋友圈");
        request.setAttribute("shareLink", request.getRequestURL());
        request.setAttribute("shareImageUrl", "http://wwww.baidu.com");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public String getStaticSrc() {
        return staticSrc;
    }

    public void setStaticSrc(String staticSrc) {
        this.staticSrc = staticSrc;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }
}
