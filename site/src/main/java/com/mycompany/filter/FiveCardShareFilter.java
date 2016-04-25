package com.mycompany.filter;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by jackie on 4/25/2016.
 */
@Component("fiveCardShareFilter")
public class FiveCardShareFilter extends GenericFilterBean {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        if (shouldProcessURI(servletRequest, servletRequest.getRequestURI())) {

        }
        chain.doFilter(request,response);
    }

    public boolean shouldProcessURI(HttpServletRequest request, String requestURI) {
        if (requestURI.endsWith("")) {
            return true;
        } else {
            return false;
        }
    }
}
