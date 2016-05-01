package com.mycompany.filter;

import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import org.broadleafcommerce.profile.core.domain.Customer;
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
