package com.mycompany.sample.util;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    public static String currentDate() {
        return formatDate(new Date());
    }

    public static String expireDate() {
        return formatDate(new Date(System.currentTimeMillis() + 15 * 60 * 1000));
    }

    public static void main(String[] args) {
        System.out.println(currentDate());
    }
}
