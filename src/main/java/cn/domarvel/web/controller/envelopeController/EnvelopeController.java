package cn.domarvel.web.controller.envelopeController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.pocustom.EnvelopeReadLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadLogService;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.utils.MailUtils;
import cn.domarvel.utils.SimpleBeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    private EnvelopeReadLogService envelopeReadLogService;

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

        try {
            String wishCode = envelopeCustom.getWishCode();//当发送信件保存成功后，这里的 wishCode 是经过 trim() 处理的。
            String receiveManEmail = envelopeService.findReceiveManEmailByWishCode(wishCode);
            MailUtils.sendEasyMail("【"+envelopeCustom.getSendMan()+"】 给你发送了一封信件",
                    "【"+envelopeCustom.getSendMan()+"】 给你发送了一封【"+envelopeCustom.getEnvelopeAim()+"】目的信件。<br>请通过祝福码在这里进行阅读该信件：http://notifymyself.com/bestwish/envelope/read/index" +
                            "<br>祝福码:【"+wishCode+"】",
                    receiveManEmail);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/bestwish/envelope/read")
    public void findEnvelopeByWishCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        String wishCode = envelopeCustom.getWishCode();
        EnvelopeCustom result = envelopeService.findEnvelopeByWishCode(wishCode);
        SimpleException.sendMessage(response,objectMapper,result);

        try {
            String remoteIP = request.getRemoteAddr();//获取远程IP

            //维护阅读访问记录
            wishCode = wishCode.trim();
            EnvelopeReadLogCustom envelopeReadLogCustom = new EnvelopeReadLogCustom();
            envelopeReadLogCustom.setIP(remoteIP);
            envelopeReadLogCustom.setWishCode(wishCode);
            envelopeReadLogService.saveEnvelopeReadLog(envelopeReadLogCustom);

            String sendManEmail = envelopeService.findSendManEmailByWishCode(wishCode);
            if(!"".equals(sendManEmail)){
                MailUtils.sendEasyMail("祝福信件阅读提醒","祝福码:【"+wishCode+"】，邮件被阅读！<br/>"+"远程阅读IP:"+remoteIP,sendManEmail);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
