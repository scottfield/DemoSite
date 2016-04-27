package com.mycompany.filter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.security.service.ExploitProtectionService;
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
 * Created by jackie on 4/27/2016.
 */
@Component
public class TokenFilter extends OncePerRequestFilter {
    private Set<String> ignoreSet = new HashSet<>();
    private static final Log LOG = LogFactory.getLog(TokenFilter.class);
    @Resource
    private ExploitProtectionService protectionService;


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
            try {
                protectionService.getCSRFToken();
            } catch (ServiceException e) {
                LOG.error("生成 crs token 失败", e);
            }
        }
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
