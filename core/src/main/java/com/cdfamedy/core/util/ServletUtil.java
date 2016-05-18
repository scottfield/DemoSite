package com.cdfamedy.core.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by jackie on 2016/3/16.
 * servlet工具类,用于获取和设定request域,session域中的属性
 */
public final class ServletUtil {
    /**
     * 获取当前线程中的http session
     *
     * @return
     */
    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    /**
     * 获取当前线程中的http session属性
     *
     * @param name 属性名称
     * @param <R>
     * @return
     */
    public static <R> R getSessionAttribute(String name) {
        return (R) getSession().getAttribute(name);
    }

    /**
     * 往session域中存入数据
     *
     * @param key   属性名称
     * @param value 属性值
     */
    public static void setSessionAttribute(String key, Object value) {
        getSession().setAttribute(key, value);

    }

    /**
     * 获取当前的HttpServletRequest请求对象
     *
     * @return
     */
    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest();
    }

    /**
     * 获取请求域中的属性值
     *
     * @param name 属性名称
     * @param <R>
     * @return
     */
    public static <R> R getRequestAttribute(String name) {
        return (R) getRequest().getAttribute(name);
    }

    /**
     * 往请求域中添加属性
     *
     * @param key   属性名称
     * @param value 属性值
     */
    public static void setRequestAttribute(String key, Object value) {
        getRequest().setAttribute(key, value);
    }

    /**
     * 获取应用上下文中的属性
     *
     * @param key
     * @param <R>
     * @return
     */
    public static <R> R getApplicationAttribute(String key) {
        return (R) getSession().getServletContext().getAttribute(key);
    }

    /**
     * 往应用上下文中添加属性
     *
     * @param key   属性名称
     * @param value 属性值
     */
    public static void setApplicationAttribute(String key, Object value) {
        getSession().getServletContext().setAttribute(key, value);
    }
}
