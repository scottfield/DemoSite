package com.mycompany.interceptor;

import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import com.mycompany.sample.service.FiveCardService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * Created by jackie on 4/29/2016.
 */
public class CheckFiveCardQuantityInterceptor implements HandlerInterceptor {
    private static final Log LOG = LogFactory.getLog(CheckFiveCardQuantityInterceptor.class);
    @Resource
    private CustomerService customerService;
    @Resource
    private FiveCardService fiveCardService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        //未领取五折卡或还未激活
        if (Objects.isNull(cardXref) || (!cardXref.getStatus())) {
            Long availableFiveCardQuantity = fiveCardService.getAvailableFiveCardQuantity(cardXref.getType());
            LOG.info("五折卡类型:" + cardXref.getType() + ",剩余数量:" + availableFiveCardQuantity);
            request.setAttribute("availableFiveCardQuantity", availableFiveCardQuantity);
            //是否显示赶快激活我五折卡
            request.setAttribute("showFiveCardAlert", availableFiveCardQuantity<100);
            return true;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
