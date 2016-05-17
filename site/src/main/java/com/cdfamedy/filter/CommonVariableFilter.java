package com.cdfamedy.filter;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

/**
 * Created by jackie on 5/5/2016.
 * 设置常用的参数，如请求路径等
 */
@Component("commonVariableFilter")
public class CommonVariableFilter extends OncePerRequestFilter {
    @Resource(name = "featuredProductCategoryId")
    private Long featuredProductCategoryId;

    @Resource(name = "offLineProductCategoryId")
    private Long offLineProductCategoryId;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String referrer = request.getParameter("referrer");
        //检测分享人
        if (Objects.nonNull(referrer)) {
            //保持referrer到session中以便后面授权成功后使用
            HttpSession session = request.getSession();
            session.setAttribute("referrer", Long.valueOf(referrer));
        }
        String url = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        String host = url.replace(uri, "");
        request.setAttribute("url", url);
        request.setAttribute("uri", uri);
        request.setAttribute("host", host);
        request.setAttribute("featuredProductCategoryId", featuredProductCategoryId);
        request.setAttribute("offLineProductCategoryId", offLineProductCategoryId);
        filterChain.doFilter(request, response);
    }
}
