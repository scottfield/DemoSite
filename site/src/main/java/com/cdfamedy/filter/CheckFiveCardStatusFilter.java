package com.cdfamedy.filter;

import com.cdfamedy.core.domain.CustomCustomer;
import com.cdfamedy.core.domain.CustomerFiveCardXref;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * Created by jackie on 5/1/2016.
 * 检测五折卡是否激活
 */
public class CheckFiveCardStatusFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        if (Objects.isNull(fiveCardXref)) {
            request.setAttribute("isUnlocked", false);
        } else {
            request.setAttribute("isUnlocked", fiveCardXref.getStatus());
        }
        filterChain.doFilter(request, response);

    }
}
