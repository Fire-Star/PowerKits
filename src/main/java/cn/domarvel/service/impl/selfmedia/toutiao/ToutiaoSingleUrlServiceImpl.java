package cn.domarvel.service.impl.selfmedia.toutiao;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.myMediaModel.BrushRequest;
import cn.domarvel.myMediaModel.toutiaoModel.singleURL.SingleURLBrush;
import cn.domarvel.service.selfmedia.toutiao.ToutiaoSingleUrlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/29
 * Time: 20:33
 */
@Service
public class ToutiaoSingleUrlServiceImpl implements ToutiaoSingleUrlService {
    private static final String TOUTIAOBASEURL = "https://www.toutiao.com/";//头条Base链接
    private static final int TOUTIAOBASEURLLEN = TOUTIAOBASEURL.length();//头条Base链接长度
    @Autowired
    private SingleURLBrush singleURLBrush;

    @Override
    public void brushSingleTraffic(BrushRequest brushRequest) throws Exception {
        String brushURL = brushRequest.getBrushURL().trim();
        if(brushRequest == null){
            throw new SimpleException("虽然你狠厉害！ 但是别乱动我的网页源代码好吗？？？");
        }
        if(brushURL.length() == 0){
            throw new SimpleException("虽然你狠厉害！ 但是别乱动我的网页源代码好吗？？？");
        }
        Callable<Void> callable = new Callable<Void>() {
            @Override
            public Void call() throws Exception {
                singleURLBrush.brushArticle(brushRequest);
                return null;
            }
        };
        FutureTask<Void> futureTask = new FutureTask<Void>(callable);
        new Thread(futureTask).start();
    }
}
