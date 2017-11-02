package cn.domarvel.myMediaModel.utils;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.myMediaModel.BrushRequest;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Set;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/29
 * Time: 21:44
 */
public class BrushHttpRequestUtils {

    private static Map<String,Integer> brushCountHas = new HashMap<>();//一个请求ID还有多少次没有刷

    private static String [] userAgends ={
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36",
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0",
            "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;",
            "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)",
            "Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1",
            "Opera/9.80 (Windows NT 6.1; U; en) Presto/2.8.131 Version/11.11",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; TencentTraveler 4.0)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; SE 2.X MetaSr 1.0; SE 2.X MetaSr 1.0; .NET CLR 2.0.50727; SE 2.X MetaSr 1.0)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Avant Browser)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)"
    };

    public static void sendPost(Map<String,String> headers, BrushRequest brushRequest) throws SimpleException {
        String brushURL = brushRequest.getBrushURL();
        int brushCount = brushRequest.getBrushCount();
        String brushID = brushRequest.getUuid();
        if(brushID == null || brushID.length() != 36){
            throw new SimpleException("请求ID不能为空！");
        }
        if(brushURL == null){
            throw new SimpleException("要访问的链接地址不能为空！");
        }
        if(brushCount <= 0){
            throw new SimpleException("访问次数必须大于 0 ！");
        }

        brushCountHas.put(brushID,brushCount);



        while (brushCount-->0){
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(brushURL);
            setHeader(headers,httpGet);//设置消息头

            CloseableHttpResponse response = null;
            headers.put("User-Agent",userAgends[new Random().nextInt(userAgends.length)]);
            try {
                response = httpClient.execute(httpGet);
            } catch (IOException e) {
                throw new SimpleException("链接地址错误，不能够访问！");
            }
            HttpEntity entity = response.getEntity();
            try {
                if("".equals(EntityUtils.toString(entity))){
                    brushCount++;
                }
            } catch (IOException e) {
                brushCount++;
            }
            brushCountHas.put(brushID,brushCount);
            System.out.println(brushCount);
            try {
                new Thread().sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        brushCountHas.remove(brushID);
    }

    public static void setHeader(Map<String,String> headers , HttpGet httpGet){
        //设置消息头
        Set<String> keys = headers.keySet();
        for (String key : keys) {
            if(key == null || key.equals("")){
                continue;
            }
            String value = headers.get(key);
            if(value == null || value.equals("")){
                continue;
            }
            httpGet.setHeader(key,value);
        }
    }

    public static Integer hasCount(String uuid) throws SimpleException {
        if(uuid == null || uuid.length() != 36){
            throw new SimpleException("获取剩余刷取数量时，ID不能为空！");
        }
        return brushCountHas.get(uuid);
    }
}
