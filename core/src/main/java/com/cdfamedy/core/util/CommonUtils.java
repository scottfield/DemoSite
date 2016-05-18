package com.cdfamedy.core.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by jackie on 4/22/2016.
 */
public final class CommonUtils {
    /**
     * 获取指定长度的随机字符串
     *
     * @param length 字符串长度
     * @return 随机字符串
     */
    public static String getRandomStrByLength(int length) {
        String src = "abcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < length; i++) {
            builder.append(src.charAt((int) (Math.random() * src.length())));
        }
        return builder.toString();
    }

    /**
     * 获取32位长的随机字符串
     *
     * @return
     * @see CommonUtils#getRandomStrByLength(int)
     */
    public static String getRandomStr() {
        return getRandomStrByLength(32);
    }

    /**
     * 已指定的日期格式对日期进行格式化
     *
     * @param date    需格式化的日期
     * @param pattern 日期格式
     * @return 格式化后的日期字符串
     */
    public static String formatDate(Date date, String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String formatedDate = formatter.format(date);
        return formatedDate;
    }

    /**
     * 采用yyyyMMddHHmmss格式对日期进行格式化
     *
     * @param date
     * @return
     * @see CommonUtils#formatDate(java.util.Date, java.lang.String)
     */
    public static String formatDate(Date date) {
        return formatDate(date, "yyyyMMddHHmmss");
    }

    /**
     * 获取系统当前时间字符串,格式为:yyyyMMddHHmmss
     *
     * @return
     */
    public static String currentDateStr() {
        return formatDate(currentDate());
    }

    /**
     * 获取系统当前日期
     *
     * @return
     */
    public static Date currentDate() {
        return new Date();
    }

    /**
     * 获取当前系统时间戳
     *
     * @return
     */
    public static long currentTimeStamp() {
        return System.currentTimeMillis();
    }

    public static String encodeUrl(String url) {
        String encodeUrl = null;
        try {
            encodeUrl = URLEncoder.encode(url, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encodeUrl;
    }

    /**
     * 对参数字符串进行sha1签名
     *
     * @param queryStr 请求字符串
     * @param keyName  密匙名称
     * @param keyValue 密匙值
     * @return 经过加密过后的字符串
     */
    public static String sha1Sign(String queryStr, String keyName, String keyValue) {
        if (Objects.nonNull(keyValue)) {
            queryStr = queryStr + "&" + keyName + "=" + keyValue;
        }
        return DigestUtils.sha1Hex(queryStr);
    }

    /**
     * @param queryStr
     * @param keyValue
     * @return
     * @see CommonUtils#sha1Sign(java.lang.String, java.lang.String, java.lang.String)
     */
    public static String sha1Sign(String queryStr, String keyValue) {
        return sha1Sign(queryStr, "app_secret", keyValue);
    }

    /**
     * @param queryStr
     * @return
     * @see CommonUtils#sha1Sign(java.lang.String, java.lang.String, java.lang.String)
     */
    public static String sha1Sign(String queryStr) {
        return sha1Sign(queryStr, null);
    }

    /**
     * 默认采用app_secret作为密匙的名称
     *
     * @param queryStr
     * @param keyValue
     * @return
     * @see CommonUtils#md5Sign(java.lang.String, java.lang.String, java.lang.String)
     */
    public static String md5Sign(String queryStr, String keyValue) {
        return md5Sign(queryStr, "app_secret", keyValue);
    }

    /**
     * 对请求字符串进行md5加密
     *
     * @param queryStr 请求参数,已key=value的形式进行拼接
     * @param keyName  密匙名称
     * @param keyValue 密匙值
     * @return 32位的加密字符串
     */
    public static String md5Sign(String queryStr, String keyName, String keyValue) {
        if (Objects.nonNull(keyValue)) {
            queryStr = queryStr + "&" + keyName + "=" + keyValue;
        }
        return DigestUtils.md5Hex(queryStr);
    }

    /**
     * 不采用密匙进行md5加密
     *
     * @param queryStr
     * @return
     * @see CommonUtils#md5Sign(java.lang.String, java.lang.String, java.lang.String)
     */
    public static String md5Sign(String queryStr) {
        return md5Sign(queryStr, null);
    }

    /**
     * 将参数列表按字母顺序表进行拼接
     *
     * @param param 参数列表
     * @return 经过排序后的拼接参数字符串
     */
    public static String getSortedStr(Map<String, Object> param) {
        Set<String> keySet = param.keySet();
        List<String> keyList = new ArrayList<>(keySet);
        Collections.sort(keyList, String.CASE_INSENSITIVE_ORDER);
        StringBuilder builder = new StringBuilder();
        for (String key : keyList) {
            Object value = param.get(key);
            builder.append(key).append("=").append(value).append("&");
        }
        //删除最末尾的&
        builder.deleteCharAt(builder.lastIndexOf("&"));
        return builder.toString();
    }

    /**
     * 过滤emoji表情
     *
     * @param source
     * @return
     */
    public static String filterEmoji(String source) {
        if (source != null) {
            Pattern emoji = Pattern.compile("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", Pattern.UNICODE_CASE | Pattern.CASE_INSENSITIVE);
            Matcher emojiMatcher = emoji.matcher(source);
            if (emojiMatcher.find()) {
                source = emojiMatcher.replaceAll("*");
                return source;
            }
            return source;
        }
        return source;
    }
}
