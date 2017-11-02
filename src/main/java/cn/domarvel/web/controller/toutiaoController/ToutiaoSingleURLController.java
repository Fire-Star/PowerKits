package cn.domarvel.web.controller.toutiaoController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.myMediaModel.BrushRequest;
import cn.domarvel.myMediaModel.utils.BrushHttpRequestUtils;
import cn.domarvel.service.ToutiaoSingleUrlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/29
 * Time: 18:42
 */
@Controller
public class ToutiaoSingleURLController {

    @Autowired
    private ToutiaoSingleUrlService toutiaoSingleUrlService;

    @RequestMapping("/media/toutiao/singleurl/**")
    public String index(){
        return "/WEB-INF/pages/toutiao/outsideDeal.jsp";
    }
    @RequestMapping("/media/toutiao/brushsingleurl/**")
    public @ResponseBody String goBrushTraffic(BrushRequest brushRequest) throws Exception {
        String uuid = UUID.randomUUID().toString();
        System.out.println(uuid);
        brushRequest.setUuid(uuid);
        toutiaoSingleUrlService.brushSingleTraffic(brushRequest);
        return "({'id':'"+uuid+"'})";
    }

    @RequestMapping("/media/toutiao/getsingleurlcount/{requestID}")
    public @ResponseBody String getCountByRequestID(@PathVariable String requestID) throws Exception{
        if(requestID == null || requestID.equals("")){
            throw new SimpleException("唯一请求ID不能为空！");
        }
        Integer count = BrushHttpRequestUtils.hasCount(requestID);
        if(count == null){
            return "({'errorType':'不存在！'})";
        }
        return "({'count':'"+count+"'})";
    }
}
