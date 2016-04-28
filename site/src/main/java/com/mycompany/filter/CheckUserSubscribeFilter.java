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
import java.util.Set;

/**
 * Created by jackie on 4/28/2016.
 * 检测用户是否关注公众号
 */
@Component
public class CheckUserSubscribeFilter extends OncePerRequestFilter {
    @Resource
    private WeixinService weixinService;
    private Set<String> ignoreSet = new HashSet<>();

    {
        ignoreSet.add("/images/");
        ignoreSet.add("/js/");
        ignoreSet.add("/css/");
        ignoreSet.add("/promotion/");
    }
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        if (shouldProcessURI(requestURI)) {
//            weixinService.getUserInfo();
        }
    }
    public boolean shouldProcessURI(String uri) {
        for (String ignoreUri : ignoreSet) {
            if (uri.startsWith(ignoreUri)) {
                return false;
            }
        }
        return true;

    }
}
