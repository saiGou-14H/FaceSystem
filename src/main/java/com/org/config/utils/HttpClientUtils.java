package com.org.config.utils;

import org.apache.http.HttpHost;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class HttpClientUtils {

    private static PoolingHttpClientConnectionManager connectionManager = null;
    private static HttpClientBuilder httpBuilder = null;
    private static RequestConfig requestConfig = null;

    private static int MAXCONNECTION = 100;

    private static int DEFAULTMAXCONNECTION = 50;

    private static String IP = "cnivi.com.cn";
    private static int PORT = 80;

    public static HttpClient client = null;
    private static CloseableHttpClient httpClient = null;

    static {
        //设置http的状态参数
        requestConfig = RequestConfig.custom()
                .setSocketTimeout(5000)           //一、连接超时：connectionTimeout-->指的是连接一个url的连接等待时间
                .setConnectTimeout(50000)          // 二、读取数据超时：SocketTimeout-->指的是连接上一个url，获取response的返回等待时间
                .setConnectionRequestTimeout(50000)//三、从连接池获取连接的超时时间:ConnectionRequestTimeout
                .build();

       //Request不会继承客户端级别的请求配置，所以在自定义Request的时候，需要将客户端的默认配置拷贝过去：
        HttpHost target = new HttpHost(IP, PORT);
        connectionManager = new PoolingHttpClientConnectionManager();
        connectionManager.setMaxTotal(MAXCONNECTION);                   //客户端总并行链接最大数
        connectionManager.setDefaultMaxPerRoute(DEFAULTMAXCONNECTION); //每个主机的最大并行链接数
        connectionManager.setMaxPerRoute(new HttpRoute(target), 20);//某一个服务每次能并行接收的请求数量
        httpBuilder = HttpClients.custom();
        httpBuilder.setConnectionManager(connectionManager);

        client = getConnection();                       //开启连接
    }

    public static CloseableHttpClient getConnection() {
        System.out.println("自动开启URL连接");
        httpClient = httpBuilder.build();               //建立连接
        return httpClient;
    }

    public static String getClose() throws IOException {
        System.out.println("已关闭");
         httpClient.close();
        return "已关闭httpClient";
    }


    public static HttpUriRequest getRequestMethod(Map<String, String> map, String url, String method) {
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        Set<Map.Entry<String, String>> entrySet = map.entrySet();
        for (Map.Entry<String, String> e : entrySet) {
            String name = e.getKey();
            String value = e.getValue();
            NameValuePair pair = new BasicNameValuePair(name, value);
            params.add(pair);
        }
        HttpUriRequest reqMethod = null;
        if ("post".equals(method)) {
            reqMethod = RequestBuilder.post().setUri(url)
                    .addParameters(params.toArray(new BasicNameValuePair[params.size()]))
                    .setConfig(requestConfig).build();
        } else if ("get".equals(method)) {
            reqMethod = RequestBuilder.get().setUri(url)
                    .addParameters(params.toArray(new BasicNameValuePair[params.size()]))
                    .setConfig(requestConfig).build();
        }
        return reqMethod;
    }

}
