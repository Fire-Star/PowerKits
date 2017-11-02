package cn.domarvel.myMediaModel.toutiaoModel.singleURL;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.myMediaModel.BrushRequest;
import cn.domarvel.myMediaModel.utils.BrushHttpRequestUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/29
 * Time: 21:09
 */
@Component
public class SingleURLBrush {

    /**
     * 通过今日头条文章地址，刷取文章访问量；状态：未登录
     * @param brushRequest
     */
    public void brushArticle(BrushRequest brushRequest) throws SimpleException {
        Map<String,String> headers = new HashMap<>();
        headers.put("Host","www.toutiao.com");
        headers.put("Referer","https://www.baidu.com");
        BrushHttpRequestUtils.sendPost(headers, brushRequest);
    }
}
