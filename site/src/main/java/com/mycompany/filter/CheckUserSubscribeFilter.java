package com.mycompany.filter;

import com.mycompany.sample.service.WeixinService;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/**
 * Created by jackie on 4/28/2016.
 * 检测用户是否关注公众号
 */
@Component("checkUserSubscribeFilter")
public class CheckUserSubscribeFilter extends OncePerRequestFilter {
    @Resource
    private WeixinService weixinService;
    private static final Integer UNSUBSCRIBED = 0;//未关注公众号状态


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String openId = request.getParameter("openid");
        if (shouldProcessURI(requestURI, openId)) {
            Map<String, Object> userInfo = weixinService.getUserInfo(openId);
            if (UNSUBSCRIBED.equals(userInfo.get("subscribe"))) {
                response.sendRedirect("/wx/subscribe");
                return;
            }
            request.setAttribute("userInfo", userInfo);
            request.setAttribute("openid", openId);
        }

        filterChain.doFilter(request, response);
    }

    public boolean shouldProcessURI(String uri, String openId) {

        if (uri.equals("/") && Objects.nonNull(openId) && !openId.equals("")) {
            return true;
        }
        return false;

    }
}
