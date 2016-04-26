package com.mycompany.sample.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by jackie on 4/22/2016.
 */
public class CommonUtils {
    /**
     * 获取指定长度的随机字符串
     *
     * @param length 字符串长度
     * @return
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
     */
    public static String getRandomStr() {
        return getRandomStrByLength(32);
    }

    public static String formatDate(Date date, String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String formatedDate = formatter.format(date);
        return formatedDate;
    }

    public static String formatDate(Date date) {
        return formatDate(date, "yyyyMMddHHmmss");
    }

    public static String currentDateStr() {
        return formatDate(currentDate());
    }

    public static Date currentDate() {
        return new Date();
    }

    public static String expireDate() {
        return formatDate(new Date(System.currentTimeMillis() + 15 * 60 * 1000));
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

    public static String sha1Sign(String queryStr, String appSecret) {
        if (Objects.nonNull(appSecret)) {
            queryStr = queryStr + "&app_secret=" + appSecret;
        }
        return DigestUtils.sha1Hex(queryStr);
    }

    public static String sha1Sign(String queryStr) {
        return sha1Sign(queryStr, null);
    }

    public static String md5Sign(String queryStr, String appSecret) {
        return md5Sign(queryStr, appSecret, "app_secret");
    }

    public static String md5Sign(String queryStr, String appSecret, String keyName) {
        if (Objects.nonNull(appSecret)) {
            queryStr = queryStr + "&" + keyName + "=" + appSecret;
        }
        return DigestUtils.md5Hex(queryStr);
    }

    public static String md5Sign(String queryStr) {
        return md5Sign(queryStr, null);
    }

    public static String getSortedStr(Map<String, Object> param) {
        Set<String> keySet = param.keySet();
        List<String> keyList = new ArrayList<>(keySet);
        Collections.sort(keyList);
        StringBuilder builder = new StringBuilder();
        for (String key : keyList) {
            Object value = param.get(key);
            builder.append(key).append("=").append(value).append("&");
        }
        //删除最末尾的&
        builder.deleteCharAt(builder.lastIndexOf("&"));
        return builder.toString();
    }

    public static long currentTimeStamp() {
        return System.currentTimeMillis();
    }

    public static void main(String[] args) {
        Map<String, Object> param = new HashMap<>();
        param.put("name", "jackei");
        param.put("xx", "jackei");
        param.put("ee", "jackei");
        param.put("fdf", "jackei");
        param.put("dd", "jackei");
        String sortedStr = getSortedStr(param);
        System.out.println(md5Sign(sortedStr, "fdafda"));
    }
}
