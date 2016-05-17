package com.cdfamedy.core.dao.payment.weixin.common;

import com.cdfamedy.core.util.HttpUtil;
import com.cdfamedy.core.util.XMLUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;

/**
 * 微信签名工具类
 */
public final class WxSignature {

    private static Log logger = LogFactory.getLog(HttpUtil.class);

    /**
     * 生成MD5签名
     *
     * @param map 参数列表
     * @param key 微信商户key
     * @return 根据参数列表与商户key生成的签名
     */
    public static String getSignature(Map<String, Object> map, String key) {
        Set<String> keySet = map.keySet();
        String[] keys = new String[keySet.size()];
        Arrays.sort(keySet.toArray(keys), String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (String mapKey : keys) {
            if (!"".equals(map.get(mapKey))) {
                sb
                        .append(mapKey)
                        .append("=")
                        .append(map.get(mapKey))
                        .append("&");
            }
        }
        String result = sb.toString();
        result += "key=" + key;
        result = DigestUtils.md5Hex(result).toUpperCase();
        return result;
    }

    /**
     * 检验API返回的数据里面的签名是否合法，避免数据在传输的过程中被第三方篡改
     *
     * @param responseString API返回的XML数据字符串
     * @return API签名是否合法
     */
    public static boolean verifySignature(String responseString) {

        try {
            Map<String, Object> map = XMLUtil.getMapFromXML(responseString);
            logger.debug(map.toString());
            String signFromAPIResponse = map.get("sign").toString();
            if (signFromAPIResponse == "" || signFromAPIResponse == null) {
                logger.debug("API返回的数据签名数据不存在，有可能被第三方篡改!!!");
                return false;
            }
            logger.debug("服务器回包里面的签名是:" + signFromAPIResponse);
            //清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
            map.put("sign", "");
            //将API返回的数据根据用签名算法进行计算新的签名，用来跟API返回的签名进行比较
            String signForAPIResponse = WxSignature.getSignature(map, "");

            if (!signForAPIResponse.equals(signFromAPIResponse)) {
                //签名验不过，表示这个API返回的数据有可能已经被篡改了
                logger.debug("API返回的数据签名验证不通过，有可能被第三方篡改!!!");
                return false;
            }
            logger.debug("恭喜，API返回的数据签名验证通过!!!");
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
