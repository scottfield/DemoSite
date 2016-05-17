package com.cdfamedy.util;

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
public class HttpUtil {
    public static final HttpSession getSession() {
        return getRequest().getSession();
    }

    public static final <R> R getSessionAttribute(String name) {
        return (R) getSession().getAttribute(name);
    }

    public static final void setSessionAttribute(String key, Object value) {
        getSession().setAttribute(key, value);

    }

    public static final HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest();
    }

    public static final <R> R getRequestAttribute(String name) {
        return (R) getRequest().getAttribute(name);
    }

    public static final void setRequestAttribute(String key, Object value) {
        getRequest().setAttribute(key, value);
    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url   发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url;
            if (Objects.nonNull(param)) {
                urlNameString = url + "?" + param;
            }
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            /*// 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
                if (key != null && !key.equals("null")) {
                    jso.put(key, map.get(key).toString().replace("[", "").replace("]", ""));
                }

            }*/
//			if (connection.getResponseCode() == 302) {
//				// 如果会重定向，保存302重定向地址，以及Cookies,然后重新发送请求(模拟请求)
//				String location = cconnectiononn.getHeaderField("Location");
//			}
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), Charset.forName("utf-8")));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url   发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    public static String get302(String url, String param, HttpServletResponse response) {
        String result = "";
        try {

            StringBuffer buffer = new StringBuffer();

            String urlNameString = url + "?" + param;
            //URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            //URLConnection connection = realUrl.openConnection();
            // 发送get请求
            URL serverUrl = new URL(urlNameString);
            HttpURLConnection conn = (HttpURLConnection) serverUrl
                    .openConnection();
            conn.setRequestMethod("GET");
            // 必须设置false，否则会自动redirect到重定向后的地址
            conn.setInstanceFollowRedirects(false);
            conn.addRequestProperty("Accept-Charset", "UTF-8;");
            conn.addRequestProperty("User-Agent",
                    "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Firefox/3.6.8");
            conn.addRequestProperty("Referer", "http://matols.com/");
            conn.connect();

            // 判定是否会进行302重定向
            if (conn.getResponseCode() == 302) {
                // 如果会重定向，保存302重定向地址，以及Cookies,然后重新发送请求(模拟请求)
                String location = conn.getHeaderField("Location");
                String cookies = conn.getHeaderField("Set-Cookie");
                response.sendRedirect(location);
//				serverUrl = new URL(location);
//				conn = (HttpURLConnection) serverUrl.openConnection();
//				conn.setRequestMethod("GET");
//				conn.setRequestProperty("Cookie", cookies);
//				conn.addRequestProperty("Accept-Charset", "UTF-8;");
//				conn.addRequestProperty("User-Agent",
//						"Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Firefox/3.6.8");
//				conn.addRequestProperty("Referer", "http://matols.com/");
//				conn.connect();
//				System.out.println("跳转地址:" + location);
            }

            // 将返回的输入流转换成字符串
            InputStream inputStream = conn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(
                    inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(
                    inputStreamReader);
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            // 释放资源
            inputStream.close();
            inputStream = null;
            result = buffer.toString();
            System.out.println(buffer.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static void main(String[] args) throws Exception {
        String url = "http://crvweixin.crv.com.cn/activities/actUrlManager/actUrlManager_getToken.action";
        String param = "appidType=6";
        String result = sendGet(url, param);
        System.out.println(result);
        String postResult = sendPost("https://api.weixin.qq.com/cgi-bin/ticket/getticket", "access_token=" + result + "&type=jsapi");
        System.out.println(postResult);
    }

    public static String jiemi() {
        String test = "h5QzfOPBDoaUq51PLrZGD1KWI:qq8t2fmJZ7GxKIFnje2REfK5d62sKD*rJzAWCP9aqA56pYRcJ3LIbGWEqZvhi1*dvjZSwLp*y84o2ULeq9XRR6bQRxYFCgU4ctY*zM*gSRqonu83eRsRfxtyFh3b6sXfdz9xEWKlqW*CuiZS9nXJsYUreVP44Er6Q4p5bbfOH:3ciwWgHWv*X5t9vv8ZOL7BwEfuN06JzKEOhgJUmLnfVmS3H2wAiQ3jNmNUQiNz9xBvzYUR:6:WitwIPo8UlQcndq3u0BCW9xhU:pR7ILXcsK7xZQ67mX*9mUQFrpDqvw1sLYoIpTKopAj6mnQscChSzVfQkYIN:YCD7B53TeHaxPoZnix*yzXq09KronzIWaCSgPnz1ueEXvgaL144:Zk9WcpLGwJUciKuzbcZkzg3TarhLQswcygaek3MU5w:L5toT8Cc9NE00R14psxs0ui:ucNAMHkdo*hVv6tVVWeXxGRYbZdau:n:P7mPHFre5blW7xnPKL:j7mlDv0sph3yhvC5lk4GfdmvDFzt4TlsLNtHqF7gg__";

        String rt = "";
        test = rp(test);


        byte[] keys = new String("crv_ehasdfu_sgfnasdbf_pw").getBytes();

        try {
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] buf = decoder.decodeBuffer(test);

            rt = new String(buf, "UTF-8");
//			BASE64Encoder encoder = new BASE64Encoder();
//
//			String b=encoder.encode(a.getBytes());
//			System.out.println(new String(buf,"UTF-8"));
//			rt = decrypt(test,"crv_ehasdfu_sgfnasdbf_pw");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //
//		rt = desedesecret

        return rt;
    }

    public static String rp(String v) {
        String rt = "";
        rt = v.replace("*", "+").replace(":", "/").replace("_", "=");


        return rt;
    }

    /**
     * 数据解密，算法（DES）
     *
     * @param cryptData 加密数据
     * @return 解密后的数据
     */
    public static String decryptBasedDes(String cryptData, byte[] DES_KEY) {
        String decryptedData = null;
        try {
            // DES算法要求有一个可信任的随机数源
            SecureRandom sr = new SecureRandom();
            DESKeySpec deskey = new DESKeySpec(DES_KEY);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(deskey);
            // 解密对象
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.DECRYPT_MODE, key, sr);
            // 把字符串解码为字节数组，并解密
            decryptedData = new String(cipher.doFinal(new BASE64Decoder().decodeBuffer(cryptData)));
        } catch (Exception e) {
//            log.error("解密错误，错误信息：", e);
            throw new RuntimeException("解密错误，错误信息：", e);
        }
        return decryptedData;
    }

    /**
     * Description 根据键值进行解密
     *
     * @param data
     * @param key  加密键byte数组
     * @return
     * @throws IOException
     * @throws Exception
     */
    public static String decrypt(String data, String key) throws IOException,
            Exception {
        if (data == null)
            return null;
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] buf = decoder.decodeBuffer(data);
        byte[] bt = decrypt(buf, key.getBytes());
        return new String(bt);
    }

    private final static String DES = "DES";

    /**
     * Description 根据键值进行解密
     *
     * @param data
     * @param key  加密键byte数组
     * @return
     * @throws Exception
     */
    private static byte[] decrypt(byte[] data, byte[] key) throws Exception {
        // 生成一个可信任的随机数源
        SecureRandom sr = new SecureRandom();

        // 从原始密钥数据创建DESKeySpec对象
        DESKeySpec dks = new DESKeySpec(key);

        // 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher对象实际完成解密操作
        Cipher cipher = Cipher.getInstance(DES);

        // 用密钥初始化Cipher对象
        cipher.init(Cipher.DECRYPT_MODE, securekey, sr);

        return cipher.doFinal(data);
    }
}
