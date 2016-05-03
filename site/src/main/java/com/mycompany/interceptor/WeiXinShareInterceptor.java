package com.mycompany.interceptor;

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
        request.setAttribute("shareTitle", "分享到朋友圈");
        request.setAttribute("shareDesc", "分享到朋友圈");
        Customer customer = CustomerState.getCustomer();
        String shareLink = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        shareLink = shareLink.replace(uri, "");
        if (Objects.nonNull(customer) && "/fiveCard/share/page".equals(uri)) {
            shareLink = shareLink + "/fiveCard/share?referrer=" + customer.getId();
        } else {
            shareLink = shareLink +"/index";
        }
        request.setAttribute("shareLink", shareLink);
        request.setAttribute("shareImageUrl", "http://wwww.baidu.com");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
