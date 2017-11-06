package cn.domarvel.web.controller.envelopeController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.SimpleBeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/5
 * Time: 18:30
 */
@Controller
public class EnvelopeController {

    @Autowired
    private EnvelopeService envelopeService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping("/berstwish/envelope/index")
    public String index(){
        return "/WEB-INF/pages/birthday/envelopeFunctionChose.jsp";
    }

    @RequestMapping("/bestwish/envelope/edit/index")
    public String editIndex(){
        return "/WEB-INF/pages/birthday/envelope-edit.jsp";
    }

    @RequestMapping("/bestwish/envelope/read/index")
    public String readIndex(){
        return "/WEB-INF/pages/birthday/envelope.jsp";
    }

    @RequestMapping("/bestwish/envelope/send")
    public void sendEnvelope(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        envelopeService.sendEnvelope(envelopeCustom);
        SimpleException.sendMessage(response,objectMapper,"发送成功！");
    }

    @RequestMapping("/bestwish/envelope/read")
    public void findEnvelopeByWishCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        String wishCode = envelopeCustom.getWishCode();
        EnvelopeCustom result = envelopeService.findEnvelopeByWishCode(wishCode);
        SimpleException.sendMessage(response,objectMapper,result);
    }
}
