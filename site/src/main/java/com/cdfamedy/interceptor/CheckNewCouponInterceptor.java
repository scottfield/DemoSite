package com.cdfamedy.interceptor;

import com.cdfamedy.core.catalog.domain.Coupon;
import com.cdfamedy.core.catalog.domain.CustomCustomer;
import com.cdfamedy.core.catalog.domain.CustomerCouponXref;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by jackie on 4/29/2016.
 * 检测A卡用户是否有新获取到的线下优惠券,如果有则提示用户
 */
public class CheckNewCouponInterceptor implements HandlerInterceptor {
    @Resource
    private CustomerService customerService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        List<CustomerCouponXref> couponXrefs = customer.getCouponXrefs();
        boolean hasNewShareCoupon = couponXrefs.stream().anyMatch(xref -> xref.getCoupon().getType() == Coupon.OFFLINE_A && xref.isNewCoupon());
        if (hasNewShareCoupon) {
            couponXrefs.stream().forEach(couponXref -> couponXref.setNewCoupon(false));
            customerService.saveCustomer(customer);
        }
        request.setAttribute("showNewShareCouponDialog", hasNewShareCoupon);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
