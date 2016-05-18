package com.mycompany.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;

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
        String target = referrer.replace(host, "");
        if (target.indexOf("?") > 0) {
            target = target.substring(0, target.indexOf("?"));
        }
        String message = "";
        if ("/manage/couponAndFiveCard".equals(target)||"/index".equals(target)) {
            message = "电子五折卡领取活动，已经结束啦！";
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
