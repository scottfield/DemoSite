package com.mycompany.filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by jackie on 4/27/2016.
 */
public class CouponFilter extends OncePerRequestFilter {
    private Set<String> ignoreSet = new HashSet<>();

    {
        ignoreSet.add("/images/");
        ignoreSet.add("/js/");
        ignoreSet.add("/css/");
        ignoreSet.add("/promotion/");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        filterChain.doFilter(request, response);
    }

    private boolean shouldProcessURI(String uri) {
        for (String ignoreUri : ignoreSet) {
            if (uri.startsWith(ignoreUri)) {
                return false;
            }
        }
        return true;

    }
}
