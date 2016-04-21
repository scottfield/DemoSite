package com.mycompany.interceptor;

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
    private static final String SALT = new Date().toString();
    private static final Md5PasswordEncoder MD5_ENCODER = new Md5PasswordEncoder();
    private static final ShaPasswordEncoder SHA_ENCODER = new ShaPasswordEncoder();

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

    private HashMap generateTicket() {
        Date generateDate = new Date();
        long timestamp = generateDate.getTime();
        String queryStr = "app_key=" + appKey + "&nonce=" + timestamp + "&stat_src=" + staticSrc + "&timestamp=" + timestamp;
        String tempStr = queryStr + "&app_secret=" + appSecret;
        String sign = MD5_ENCODER.encodePassword(tempStr, null);
        String url = "http://weixin.cplotus.com/weixin/jsapi_ticket.ashx?" + queryStr + "&sign=" + sign;
        String result = HttpUtil.sendGet(url, null);
        HashMap ticket = JsonHelper.toObject(result, HashMap.class);
        if (ticket.get("errcode").equals(0)) {
            ticket.put("timestamp", timestamp);
            ticket.put("nonce", timestamp);
            ticket.put("generateDate", generateDate);
        } else {
            throw new RuntimeException("生成ticket失败,详细信息：" + ticket.toString());
        }
        return ticket;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        ServletContext servletContext = request.getSession().getServletContext();
        HashMap<String, Object> ticketMap = (HashMap<String, Object>) servletContext.getAttribute("ticketMap");
        long nonce = (long) ticketMap.get("nonce");
        long timestamp = (long) ticketMap.get("timestamp");
        String ticket = (String) ticketMap.get("ticket");
        String url = request.getRequestURL().toString();
        //$string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";
        String tempStr = "jsapi_ticket=" + ticket + "&noncestr=" + nonce + "&timestamp=" + timestamp + "&url=" + url;
//        String signature = SHA_ENCODER.encodePassword(tempStr, null);
        String signature = DigestUtils.sha1Hex(tempStr);
        ticketMap.put("signature", signature);
        request.setAttribute("ticketMap", ticketMap);
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
}
