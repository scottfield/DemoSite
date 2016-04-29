package com.mycompany.interceptor;

import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
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
public class ShowFiveCardActiveCongratulationInterceptor implements HandlerInterceptor {
    @Resource
    private CustomerService customerService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        //还未领取五折卡
        if (Objects.isNull(cardXref)) {
            return true;
        }
        Boolean status = cardXref.getStatus();
        Boolean showDialog = cardXref.getShowDialog();
        //五折卡状态为激活,并且显示提示为true则显示恭喜对话框
        if (status && showDialog) {
            request.setAttribute("showDialog", true);
            //重置显示对话框未不显示
            cardXref.setShowDialog(false);
            customerService.saveCustomer(customer);
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
