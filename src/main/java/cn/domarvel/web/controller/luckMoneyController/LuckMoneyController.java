package cn.domarvel.web.controller.luckMoneyController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.luckmoney.LuckMoneyLogCustom;
import cn.domarvel.service.luckmoney.LuckMoneyLogService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/12/13
 * Time: 1:06
 */
@Controller
public class LuckMoneyController {

    @Autowired
    private LuckMoneyLogService luckMoneyLogService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping("/luckmoney/intro")
    public String index(HttpServletRequest request) throws Exception {

        {//统计访问次数
            String ip = request.getRemoteAddr();
            LuckMoneyLogCustom luckMoneyLogCustom = new LuckMoneyLogCustom();
            luckMoneyLogCustom.setIp(ip);
            luckMoneyLogService.addCountByIP(luckMoneyLogCustom);
        }

        return "/WEB-INF/pages/luckMoney/index.html";
    }

    @RequestMapping("/luckmoney/getAllPageCount")
    public void getAllPageCount(HttpServletResponse response) throws Exception {
        Integer allCount = luckMoneyLogService.count();
        SimpleException.sendMessage(response,objectMapper,"success",allCount.toString());
    }

    @RequestMapping("/luckmoney/showvisitlog")
    public String showLuckMoneyLog(){
        return "/WEB-INF/pages/luckMoney/log.html";
    }
}
