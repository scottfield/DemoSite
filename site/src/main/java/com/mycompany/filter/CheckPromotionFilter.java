package com.mycompany.filter;

import com.mycompany.sample.core.catalog.domain.Promotion;
import com.mycompany.sample.service.PromotionService;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * Created by jackie on 4/25/2016.
 * 检测活动是否开始
 */
@Component("checkPromotionFilter")
public class CheckPromotionFilter extends OncePerRequestFilter {
    @Resource
    private PromotionService promotionService;

    private Set<String> ignoreSet = new HashSet<>();

    {
        ignoreSet.add("/images/");
        ignoreSet.add("/js/");
        ignoreSet.add("/css/");
        ignoreSet.add("/promotion/");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if (!shouldProcessURI(request.getRequestURI())) {
            filterChain.doFilter(request, response);
            return;
        }
        //检查活动是否还在进行
        Promotion currentPromotion = promotionService.getPromotionById(1L);
        Date now = new Date();
        //活动已取消
        if (Objects.isNull(currentPromotion)) {
        } else if (currentPromotion.getStartDate().after(now)) {
            //活动还未开始
            response.sendRedirect("/promotion/countdown");
            return;
        } else if (currentPromotion.getEndDate().before(now)) {
            //活动已经结束

        }
        //活动还未开始


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
