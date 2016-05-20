package com.mycompany.interceptor;

import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.Objects;

/**
 * Created by jackie on 5/20/2016.
 */
public class CheckFiveCardIssueDateInterceptor implements HandlerInterceptor {
    private static final Date endDate;

    static {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2016);
        calendar.set(Calendar.MONTH, Calendar.MAY);
        calendar.set(Calendar.DAY_OF_MONTH, 20);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        endDate = calendar.getTime();
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Date now = new Date();

        if (now.before(endDate)) {
            return true;
        }

        String url = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        String host = url.replace(uri, "");
        String referrer = request.getHeader("Referer");
        String target = "/index";
        if (Objects.nonNull(referrer)) {
            target = referrer.replace(host, "");

        }
        if (target.indexOf("?") > 0) {
            target = target.substring(0, target.indexOf("?"));
        }
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        String message = "领卡活动已结束，已领五折卡在卡券中查看";
        //只有激活五折卡用户才能进入五折卡页面
        if (("/fiveCard/issue".equals(uri)||"/fiveCard".equals(uri)) && Objects.nonNull(fiveCardXref) && fiveCardXref.getStatus()) {
            return true;
        }
        //提示分享已结束
        if ("/fiveCard/share/page".equals(uri)) {
            message = "分享五折卡活动已经结束！";
            response.sendRedirect(target + "?message=" + URLEncoder.encode(message, "utf-8"));
            return true;
        }
        //有卡但是未激活用户
        if ("/manage/couponAndFiveCard".equals(target)&& Objects.nonNull(fiveCardXref)) {
            message = "五折卡激活时间已过期";
        }
        response.sendRedirect(target + "?message=" + URLEncoder.encode(message, "utf-8"));
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
