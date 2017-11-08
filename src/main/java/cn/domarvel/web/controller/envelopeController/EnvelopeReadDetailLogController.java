package cn.domarvel.web.controller.envelopeController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeReadDetailLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadDetailLogService;
import cn.domarvel.utils.SimpleBeanUtils;
import cn.domarvel.vo.EnvelopeReadDetailLogVo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/8
 * Time: 14:47
 */
@Controller
public class EnvelopeReadDetailLogController {

    @Autowired
    private EnvelopeReadDetailLogService envelopeReadDetailLogService;

    @Autowired
    private ObjectMapper objectMapper;

    public static SimpleDateFormat cnDateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @RequestMapping("/bestwish/envelope/showdetaillogindex")
    public String showDetailLog(){
        return "/WEB-INF/pages/birthday/showEnvelopeDetailReadLog.jsp";
    }

    @RequestMapping("/bestwish/envelope/showdetaillog")
    public void findEnvelopeReadDetailLogByWishCodeAndIP(HttpServletRequest request, HttpServletResponse response) throws Exception{
        EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeReadDetailLogCustom.class, request.getParameterMap());
        String wishCode = envelopeReadDetailLogCustom.getWishCode();
        String IP = envelopeReadDetailLogCustom.getIP();
        List<EnvelopeReadDetailLogCustom> tempResults = envelopeReadDetailLogService.findEnvelopeReadDetailLogByWishCodeAndIP(wishCode,IP);

        //后台数据转换成前台需要的数据
        List<EnvelopeReadDetailLogVo> results = new LinkedList<>();
        for (EnvelopeReadDetailLogCustom readDetailLogCustom : tempResults) {
            EnvelopeReadDetailLogVo envelopeReadDetailLogVo = new EnvelopeReadDetailLogVo();
            envelopeReadDetailLogVo.setIP(readDetailLogCustom.getIP());
            envelopeReadDetailLogVo.setVoTime(readDetailLogCustom.getTime());
            envelopeReadDetailLogVo.setVoTime(envelopeReadDetailLogVo.getVoTime().replaceAll("\\.0",""));
            envelopeReadDetailLogVo.setWishCode(readDetailLogCustom.getWishCode());
            results.add(envelopeReadDetailLogVo);
        }

        SimpleException.sendMessage(response,objectMapper,results);
    }
}
