package com.mycompany.filter;

import com.mycompany.sample.core.catalog.domain.Promotion;
import com.mycompany.sample.service.PromotionService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
 * Created by jackie on 4/25/2016.
 * 检测活动是否开始
 */
@Component("checkPromotionFilter")
public class CheckPromotionFilter extends OncePerRequestFilter {
    private static final Log LOG = LogFactory.getLog(CheckPromotionFilter.class);
    @Resource
    private PromotionService promotionService;

    private Set<String> ignoreSet = new HashSet<>();

    {
        ignoreSet.add("/images/");
        ignoreSet.add("/js/");
        ignoreSet.add("/css/");
        ignoreSet.add("/promotion/");
        ignoreSet.add("/wx/");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //检查活动是否还在进行
        Promotion currentPromotion = promotionService.getPromotionById(1L);
        request.setAttribute("startDate", currentPromotion.getStartDate().getTime());
        request.setAttribute("endDate", currentPromotion.getEndDate().getTime());

        if (!shouldProcessURI(request.getRequestURI())) {
            filterChain.doFilter(request, response);
            return;
        }
        request.setAttribute("promotion", currentPromotion);
        int status = currentPromotion.getStatus();
        LOG.info("当前活动状态==>" + status);

        switch (status) {
            case Promotion.NOT_START:
                response.sendRedirect("/promotion/countdown");
                return;
            case Promotion.END:
            case Promotion.IN_PROCESS:
                filterChain.doFilter(request, response);
                break;
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
