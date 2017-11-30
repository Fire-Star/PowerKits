package cn.domarvel.web.controller.envelopeController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.envelope.EnvelopeReadLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadLogService;
import cn.domarvel.utils.SimpleBeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 6:17
 */
@Controller
public class EnvelopeReadLogController {

    @Autowired
    private EnvelopeReadLogService envelopeReadLogService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping("/bestwish/envelope/showlogindex")
    public String showLog(){
        return "/WEB-INF/pages/birthday/showEnvelopeReadLog.jsp";
    }

    @RequestMapping("/bestwish/envelope/showlog")
    public void findEnvelopeReadLogsByWishCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EnvelopeReadLogCustom envelopeReadLogCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeReadLogCustom.class,request.getParameterMap());
        String wishCode = envelopeReadLogCustom.getWishCode();
        List<EnvelopeReadLogCustom> results = envelopeReadLogService.findEnvelopeReadLogsByWishCode(wishCode);
        if(results == null){
            throw new SimpleException("当前祝福码下面没有记录！");
        }
        SimpleException.sendMessage(response,objectMapper,results);
    }
}
