package com.cdfamedy.filter;

import com.cdfamedy.service.WeixinService;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
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
    private Set<String> ignoreSet = new HashSet<>();

    {
        ignoreSet.add("/fiveCard");
        ignoreSet.add("/account/addresses");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        Customer customer = CustomerState.getCustomer();
        String openId = customer.getUsername();
        if (shouldProcessURI(requestURI)) {
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

    public boolean shouldProcessURI(String uri) {

        for (String ignoreUri : ignoreSet) {
            if (uri.startsWith(ignoreUri)) {
                return false;
            }
        }
        return true;

    }
}
