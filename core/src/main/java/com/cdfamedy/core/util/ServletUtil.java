package com.cdfamedy.core.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import sun.misc.BASE64Decoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 2016/3/16.
 */
public final class ServletUtil {
    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    public static <R> R getSessionAttribute(String name) {
        return (R) getSession().getAttribute(name);
    }

    public static void setSessionAttribute(String key, Object value) {
        getSession().setAttribute(key, value);

    }

    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest();
    }

    public static <R> R getRequestAttribute(String name) {
        return (R) getRequest().getAttribute(name);
    }

    public static void setRequestAttribute(String key, Object value) {
        getRequest().setAttribute(key, value);
    }
}
