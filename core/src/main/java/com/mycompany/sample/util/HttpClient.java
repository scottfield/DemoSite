package com.mycompany.sample.util;

import org.apache.log4j.Logger;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jackie on 2016/3/16.
 */
public class HttpClient {
    private static Logger logger = Logger.getLogger(HttpClient.class);
    private static final String APP_ID = "wx9f809630dc9b839e";
    private static final String SECRET = "d42c60916acb3f82831c56046a466bfb";


    public static Map<String, Object> getAccessToken() {
        String url = "https://api.weixin.qq.com/cgi-bin/token";
        String param = "grant_type=client_credential&appid=" + APP_ID + "&secret=" + SECRET;
        String accessToken = HttpUtil.sendGet(url, param);
        /*logger.info("access token==>" + accessToken);
        String postResult = HttpUtil.sendPost("https://api.weixin.qq.com/cgi-bin/ticket/getticket", "access_token=" + accessToken + "&type=jsapi");
        ObjectMapper mapper = new ObjectMapper();
        Map token = null;
        try {
            token = mapper.readValue(postResult, HashMap.class);
            token.put("token", accessToken);
            logger.info("new token is==>" + token);
        } catch (IOException e) {
            logger.error("malformed json result ==>" + postResult, e);
        }*/
        return JsonHelper.toObject(accessToken, HashMap.class);
    }

    public static String upload(File f, String acccessToken) {
        try {
            //服务器IP(这里是从属性文件中读取出来的)
            String hostip = "api.weixin.qq.com/cgi-bin/media/uploadimg";
            URL url = new URL("https://" + hostip + "?access_token=" + acccessToken);

            HttpURLConnection uc = (HttpURLConnection) url.openConnection();
            //上传图片的一些参数设置
            uc.setRequestProperty(
                    "Accept",
                    "image/gif,   image/x-xbitmap,   image/jpeg,   image/pjpeg,   application/vnd.ms-excel,   application/vnd.ms-powerpoint,   application/msword,   application/x-shockwave-flash,   application/x-quickviewplus,   */*");
            uc.setRequestProperty("Accept-Language", "zh-cn");
            uc.setRequestProperty("Content-type",
                    "multipart/form-data;   boundary=---------------------------7d318fd100112");
            uc.setRequestProperty("Accept-Encoding", "gzip,   deflate");
            uc.setRequestProperty("User-Agent",
                    "Mozilla/4.0   (compatible;   MSIE   6.0;   Windows   NT   5.1)");
            uc.setRequestProperty("Connection", "Keep-Alive");
            uc.setDoOutput(true);
            uc.setUseCaches(true);

            //读取文件流
            int size = (int) f.length();
            byte[] data = new byte[size];
            FileInputStream fis = new FileInputStream(f);
            OutputStream out = uc.getOutputStream();
            fis.read(data, 0, size);
            //写入文件名
            out.write("buffer".getBytes());
            //写入分隔符
            out.write('|');
            //写入图片流
            out.write(data);
            out.flush();
            out.close();
            fis.close();

            //读取响应数据
            int code = uc.getResponseCode();
            String sCurrentLine = "";
            //存放响应结果
            String sTotalString = "";
            if (code == 200) {
                InputStream is = uc.getInputStream();
                BufferedReader reader = new BufferedReader(
                        new InputStreamReader(is));
                while ((sCurrentLine = reader.readLine()) != null)
                    if (sCurrentLine.length() > 0)
                        sTotalString = sTotalString + sCurrentLine.trim();
            } else {
                sTotalString = "远程服务器连接失败,错误代码:" + code;
            }
            return sTotalString;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 模拟form表单的形式 ，上传文件 以输出流的形式把文件写入到url中，然后用输入流来获取url的响应
     *
     * @param url      请求地址 form表单url地址
     * @param filePath 文件在服务器保存路径
     * @return String url的响应信息返回值
     * @throws IOException
     */
    public static Map send(String url, String filePath, Map<String, Object> params) throws IOException {


        String result = null;
        File file = new File(filePath);
        if (!file.exists() || !file.isFile()) {
            throw new IOException("文件不存在");
        }

        /**
         * 第一部分
         */
        URL urlObj = new URL(url);
        // 连接
        HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();


        /**
         * 设置关键值
         */
        con.setRequestMethod("POST"); // 以Post方式提交表单，默认get方式
        con.setDoInput(true);
        con.setDoOutput(true);
        con.setUseCaches(false); // post方式不能使用缓存


        // 设置请求头信息
        con.setRequestProperty("Connection", "Keep-Alive");
        con.setRequestProperty("Charset", "UTF-8");


        // 设置边界
        String BOUNDARY = "----------" + System.currentTimeMillis();
        con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

        // 请求正文信息


        // 第一部分：
        StringBuilder sb = new StringBuilder();
        sb.append("--"); // 必须多两道线
        sb.append(BOUNDARY);
        sb.append("\r\n");
        sb.append("Content-Disposition: form-data;name=\"file\";filename=\""
                + file.getName() + "\"\r\n");
        sb.append("Content-Type:application/octet-stream\r\n\r\n");

        byte[] head = sb.toString().getBytes("utf-8");


        // 获得输出流
        OutputStream out = new DataOutputStream(con.getOutputStream());
        OutputStreamWriter writer = new OutputStreamWriter(out);
        writer.flush();
        // 输出表头
        out.write(head);


        // 文件正文部分
        // 把文件已流文件的方式 推入到url中
        DataInputStream in = new DataInputStream(new FileInputStream(file));
        int bytes = 0;
        byte[] bufferOut = new byte[1024];
        while ((bytes = in.read(bufferOut)) != -1) {
            out.write(bufferOut, 0, bytes);
        }
        in.close();


        // 结尾部分
        byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线
        out.write(foot);
        out.flush();
        out.close();

        StringBuffer buffer = new StringBuffer();
        BufferedReader reader = null;
        try {
            // 定义BufferedReader输入流来读取URL的响应
            reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                //System.out.println(line);
                buffer.append(line);
            }
            if (result == null) {
                result = buffer.toString();
            }
        } catch (IOException e) {
            System.out.println("发送POST请求出现异常！" + e);
            e.printStackTrace();
            throw new IOException("数据读取异常");
        } finally {
            if (reader != null) {
                reader.close();
            }
        }
        return JsonHelper.toObject(result, HashMap.class);
    }
}
