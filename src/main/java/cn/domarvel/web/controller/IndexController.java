package cn.domarvel.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/30
 * Time: 0:31
 */
@Controller
public class IndexController {
    @RequestMapping("/index")
    public String mainPage(){
        return "/WEB-INF/pages/index.jsp";
    }
    @RequestMapping("/media/toutiao/index")
    public String toutiaoIndex(){
        return "/WEB-INF/pages/toutiao/index.jsp";
    }
}
