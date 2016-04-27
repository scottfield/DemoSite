package com.mycompany.interceptor;

import com.mycompany.sample.core.WeiXinConstants;
import com.mycompany.sample.service.WeixinService;
import com.mycompany.sample.util.CommonUtils;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/21/2016.
 * 生成微信js sdk签名
 */
public class WeiXinInterceptor implements HandlerInterceptor {
    private volatile static int count = 0;
    private static final int maxTry = 3;
    @Resource
    private WeixinService weixinService;

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

    private synchronized Map generateTicket() {

        Map<String, Object> ticket = weixinService.getTicket();
        if (Objects.nonNull(ticket) && ticket.get("errcode").equals(0)) {
            ticket.put("timestamp", ticket.get("timestamp"));
            ticket.put("nonce", ticket.get("nonce"));
            ticket.put("appId", WeiXinConstants.APP_ID);
        } else {
            throw new RuntimeException("生成ticket失败,详细信息：" + ticket.toString());
        }
        return ticket;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        ServletContext servletContext = request.getSession().getServletContext();
        Map<String, Object> ticketMap = (Map<String, Object>) servletContext.getAttribute("ticketMap");
        String nonce = (String) ticketMap.get("nonce");
        long timestamp = (long) ticketMap.get("timestamp");
        String ticket = (String) ticketMap.get("ticket");
        String url = request.getRequestURL().toString();
        //填写签名参数
        Map<String, Object> param = new HashMap<>();
        param.put("jsapi_ticket", ticket);
        param.put("noncestr", nonce);
        param.put("timestamp", timestamp);
        param.put("url", url);
        String tempStr = CommonUtils.getSortedStr(param);
        //生成签名
        String signature = CommonUtils.sha1Sign(tempStr);

        ticketMap.put("signature", signature);
        request.setAttribute("ticketMap", ticketMap);
        //分享相关
        request.setAttribute("shareTitle", "分享到朋友圈");
        request.setAttribute("shareDesc", "分享到朋友圈");
        Customer customer = CustomerState.getCustomer();
        String shareLink = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        shareLink = shareLink.replace(uri, "");
        if (Objects.nonNull(customer)) {
            shareLink = shareLink + "/fiveCard/share?referrer=" + customer.getId();
        }
        request.setAttribute("shareLink", shareLink);
        request.setAttribute("shareImageUrl", "http://wwww.baidu.com");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
