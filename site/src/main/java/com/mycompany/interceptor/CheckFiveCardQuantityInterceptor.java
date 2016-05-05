package com.mycompany.interceptor;

import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import com.mycompany.sample.service.FiveCardService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * Created by jackie on 4/29/2016.
 * 检测五折卡的剩余数量
 */
public class CheckFiveCardQuantityInterceptor implements HandlerInterceptor {
    private static final Log LOG = LogFactory.getLog(CheckFiveCardQuantityInterceptor.class);
    @Resource
    private FiveCardService fiveCardService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        HttpSession session = request.getSession();
        Object showFiveCardAlert = session.getAttribute("showFiveCardAlert");
        Object uri = request.getAttribute("uri");
        if (Objects.nonNull(showFiveCardAlert) && Boolean.TRUE.equals(showFiveCardAlert)) {
            session.setAttribute("showFiveCardAlert", false);
        }
        //用户拥有未激活的的五折卡
        if (Objects.nonNull(cardXref) && (!cardXref.getStatus()) && Objects.isNull(showFiveCardAlert)) {
            Integer cardType = cardXref.getType();
            Long availableFiveCardQuantity = fiveCardService.getAvailableFiveCardQuantity(cardType);
            Long totalFiveCardQuantity = fiveCardService.getTotalFiveCardQuantityByType(cardType);
            LOG.info("五折卡类型:" + cardType + ",剩余数量:" + availableFiveCardQuantity);
            request.setAttribute("availableFiveCardQuantity", availableFiveCardQuantity);
            Integer promotionStatus = (Integer) request.getAttribute("promotionStatus");
            //五折卡数量低于100张或线下活动已近开始则提示激活五折卡
            session.setAttribute("showFiveCardAlert", availableFiveCardQuantity < totalFiveCardQuantity * 0.1 || promotionStatus == 1);
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
