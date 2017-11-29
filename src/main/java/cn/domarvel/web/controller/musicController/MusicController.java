package cn.domarvel.web.controller.musicController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/29
 * Time: 10:16
 */
@Controller
public class MusicController {
    @RequestMapping("/music/outlink")
    public String index(){
        return "/WEB-INF/pages/music/outlink.jsp";
    }
}
