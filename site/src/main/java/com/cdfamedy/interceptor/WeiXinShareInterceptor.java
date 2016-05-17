package com.cdfamedy.interceptor;

import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * Created by jackie on 4/28/2016.
 */
public class WeiXinShareInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //分享相关

        Customer customer = CustomerState.getCustomer();
        String shareLink = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        shareLink = shareLink.replace(uri, "");
        String shareTitle = "“友”福同享 “蜂”狂五折！";
        String shareDesc = "五折预售—“友”福同享，“蜂”狂五折！“荐”者有份，爱抢不抢！";
        String shareImageUrl = shareLink + "/images/share/share_promotion.jpg";
        if (Objects.nonNull(customer) && "/fiveCard/share/page".equals(uri)) {
            shareTitle = "朋友，你有一张卜蜂莲花电子五折卡，请查收！";
            shareDesc = "叫上真朋友，牵手去购物！一起扛货，一起happy！";
            shareImageUrl = shareLink + "/images/share/share_with_friend.jpg";
            shareLink = shareLink + "/fiveCard/share?referrer=" + customer.getId();
        } else {
            shareLink = shareLink + "/index";
        }
        request.setAttribute("shareTitle", shareTitle);
        request.setAttribute("shareDesc", shareDesc);
        request.setAttribute("shareLink", shareLink);
        request.setAttribute("shareImageUrl", shareImageUrl);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
