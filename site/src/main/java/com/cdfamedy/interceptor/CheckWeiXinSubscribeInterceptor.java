package com.cdfamedy.interceptor;

import com.cdfamedy.service.WeixinService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by jackie on 4/28/2016.
 * 检测是否关注公众号
 */
public class CheckWeiXinSubscribeInterceptor implements HandlerInterceptor {
    @Resource
    private WeixinService weixinService;
    private static final Integer UNSUBSCRIBED = 0;//未关注公众号状态

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //检测请求参数中是否包含open id
        String openId = request.getParameter("openid");
        if (StringUtils.isBlank(openId)) {
            response.sendRedirect("/login");
            return false;
        }
        //检测用户是否关注公众号
        Map<String, Object> userInfo = weixinService.getUserInfo(openId);
        request.setAttribute("userInfo", userInfo);
        request.setAttribute("openid", openId);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
