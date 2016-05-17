package com.cdfamedy.core.util;


import org.apache.commons.codec.Charsets;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.net.SocketTimeoutException;

/**
 * HttpUtil 初始化需要在Configure指定密钥的为止，以及密码
 */
public class HttpUtil {
    private static Log logger = LogFactory.getLog(HttpUtil.class);

    private static CloseableHttpClient httpClient = buildHttpClient();

    private static final ResponseHandler<String> RESPONSE_HANDLER = new StringResponseHandler();

    public static CloseableHttpClient buildHttpClient() {
        RequestConfig defaultRequestConfig = RequestConfig.custom()
                .setConnectTimeout(5000)
                .setConnectionRequestTimeout(5000)
                .setSocketTimeout(5000).build();

        return HttpClients.custom().setDefaultRequestConfig(defaultRequestConfig).build();
    }


    public static String doGet(String requestUrl) {
        HttpGet httpget = new HttpGet(requestUrl);
        try {
            logger.debug("Executing request " + httpget.getRequestLine());
            return httpClient.execute(httpget, RESPONSE_HANDLER);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            httpget.releaseConnection();
        }
        return null;
    }

    public static String doPost(String url, Object object2Xml) {

        HttpPost httpPost = new HttpPost(url);
        //setup xml post entity
        String postDataXML = XMLUtil.toXML(object2Xml);
        StringEntity postEntity = new StringEntity(postDataXML, Charsets.UTF_8);
        httpPost.addHeader(HttpHeaders.CONTENT_TYPE, ContentType.APPLICATION_XML.getMimeType());
        httpPost.setEntity(postEntity);

        String result = null;
        try {
            result = httpClient.execute(httpPost, RESPONSE_HANDLER);
        } catch (ConnectionPoolTimeoutException e) {
            logger.error("http get throw ConnectionPoolTimeoutException(wait time out)", e);

        } catch (ConnectTimeoutException e) {
            logger.error("http get throw ConnectTimeoutException", e);

        } catch (SocketTimeoutException e) {
            logger.error("http get throw SocketTimeoutException", e);

        } catch (Exception e) {
            logger.error("http get throw Exception", e);

        } finally {
            httpPost.releaseConnection();
        }

        return result;
    }

    private static class StringResponseHandler implements ResponseHandler<String> {

        @Override
        public String handleResponse(HttpResponse response) throws IOException {
            int status = response.getStatusLine().getStatusCode();
            if (status < 200 || status > 300) {
                throw new ClientProtocolException("Unexpected response status: " + status);
            }
            StringBuilder builder = new StringBuilder();
            InputStream inputStream = response.getEntity().getContent();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            reader.lines().forEach(builder::append);
            return builder.toString();
        }
    }
}
