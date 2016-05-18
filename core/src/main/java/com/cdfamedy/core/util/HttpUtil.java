package com.cdfamedy.core.util;


import org.apache.commons.codec.Charsets;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * 发送http请求工具类
 */
public class HttpUtil {
    private static Log logger = LogFactory.getLog(HttpUtil.class);

    private static final CloseableHttpClient httpClient = buildHttpClient();

    private static final ResponseHandler<String> RESPONSE_HANDLER = new StringResponseHandler();

    public static CloseableHttpClient buildHttpClient() {
        RequestConfig defaultRequestConfig = RequestConfig.custom()
                .setConnectTimeout(5000)
                .setConnectionRequestTimeout(5000)
                .setSocketTimeout(5000).build();

        return HttpClients.custom().setDefaultRequestConfig(defaultRequestConfig).build();
    }

    /**
     * 发送get请求
     *
     * @param requestUrl 请求路径
     * @return
     */
    public static String doGet(String requestUrl) {
        HttpGet httpget = new HttpGet(requestUrl);
        return executeRequest(httpget);
    }

    /**
     * 发送post请求,请求体为xml格式的数据
     *
     * @param url   请求路径
     * @param param 请求参数
     * @return
     */
    public static String doPost(String url, Object param) {

        HttpPost httpPost = new HttpPost(url);
        //setup xml post entity
        String postDataXML = XMLUtil.toXML(param);
        StringEntity postEntity = new StringEntity(postDataXML, Charsets.UTF_8);
        httpPost.addHeader(HttpHeaders.CONTENT_TYPE, ContentType.APPLICATION_XML.getMimeType());
        httpPost.setEntity(postEntity);
        return executeRequest(httpPost);
    }

    /**
     * 执行http请求,统一处理异常
     *
     * @param httpRequest
     * @return
     */
    private static String executeRequest(HttpRequestBase httpRequest) {
        String result = null;
        try {
            result = httpClient.execute(httpRequest, RESPONSE_HANDLER);
        } catch (org.apache.http.conn.ConnectionPoolTimeoutException e) {
            logger.error("连接管理器获取连接超时", e);

        } catch (org.apache.http.conn.ConnectTimeoutException e) {
            logger.error("连接远程主机超时", e);

        } catch (java.net.SocketTimeoutException e) {
            logger.error("套接字超时", e);

        } catch (IOException e) {
            logger.error("io异常", e);

        } finally {
            httpRequest.releaseConnection();
        }
        return result;
    }

    /**
     * 统一处理响应,将响应体转换为字符串
     */
    private static class StringResponseHandler implements ResponseHandler<String> {

        @Override
        public String handleResponse(HttpResponse response) throws IOException {
            int status = response.getStatusLine().getStatusCode();
            if (status < 200 || status > 300) {
                throw new HttpResponseException(status, "返回状态错误");
            }
            StringBuilder builder = new StringBuilder();
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            reader.lines().forEach(builder::append);
            return builder.toString();
        }
    }
}
