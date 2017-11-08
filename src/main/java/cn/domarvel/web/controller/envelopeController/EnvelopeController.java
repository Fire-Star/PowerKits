package cn.domarvel.web.controller.envelopeController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.pocustom.EnvelopeReadLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadLogService;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.service.impl.envelope.EnvelopeServiceImpl;
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

    @RequestMapping("/bestwish/envelope/index")
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

    @RequestMapping("/bestwish/envelope/reedit")
    public String reEditEnvelope(){
        return "/WEB-INF/pages/birthday/envelope-reedit.jsp";
    }

    @RequestMapping("/bestwish/envelope/send")
    public void sendEnvelope(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        String resultOrder = envelopeService.sendEnvelope(envelopeCustom);
        String wishCode = envelopeCustom.getWishCode();//当发送信件保存成功后，这里的 wishCode 是经过 trim() 处理的。

        final String emailMessage;
        final  String emailSubject;

        if(resultOrder.equals(EnvelopeServiceImpl.ENVELOPE_SAVE)){
            SimpleException.sendMessage(response,objectMapper,"信件发送成功！已经以邮件方式通知收件方前来阅读~~");
            emailSubject = "给你发送了一封信件";

            emailMessage = "【"+envelopeCustom.getSendMan()+"】 给你发送了一封【"+envelopeCustom.getEnvelopeAim()+"】目的信件。<br>请通过祝福码在这里进行阅读该信件：http://notifymyself.com/bestwish/envelope/read/index" +
                    "<br>祝福码:【"+wishCode+"】";
        }else {
            emailSubject = "修改了给你发送的信件";

            emailMessage = "【"+envelopeCustom.getSendMan()+"】 修改了祝福码为:【"+wishCode+"】，目的为:【"+envelopeCustom.getEnvelopeAim()+"】的信件。<br>请通过祝福码在这里进行阅读该信件：http://notifymyself.com/bestwish/envelope/read/index" +
                    "<br>祝福码:【"+wishCode+"】";

            SimpleException.sendMessage(response, objectMapper, "信件修改成功！已经以邮件方式通知收件方前来阅读~~");
        }

        //发送邮件通知
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {

                    String receiveManEmail = envelopeService.findReceiveManEmailByWishCode(wishCode);
                    MailUtils.sendEasyMail("【"+envelopeCustom.getSendMan()+"】"+emailSubject,
                            emailMessage,
                            receiveManEmail);
                    System.out.println("发送邮件给收信人成功！");
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }).start();
    }

    @RequestMapping("/bestwish/envelope/read")
    public void findEnvelopeByWishCode(HttpServletRequest request, HttpServletResponse response ,boolean edit) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        String wishCode = envelopeCustom.getWishCode();

        String remoteIP = request.getRemoteAddr();//获取远程IP

        EnvelopeCustom result = envelopeService.findEnvelopeByWishCode(wishCode, remoteIP,edit);
        SimpleException.sendMessage(response,objectMapper,result);
        System.out.println("edit="+edit);
        if(!edit){
            //发送邮件通知
            wishCode = wishCode.trim();
            final String finalWishCode = wishCode;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        String sendManEmail = envelopeService.findSendManEmailByWishCode(finalWishCode);
                        if(!"".equals(sendManEmail)){
                            MailUtils.sendEasyMail("【祝福信件阅读提醒】","祝福码:【"+finalWishCode+"】，邮件被阅读！<br/>"+"远程阅读IP:"+remoteIP+"<br>" +
                                            "可以通过下面地址对阅读日志进行查看：http://www.notifymyself.com/bestwish/envelope/showlogindex?wishCode="+finalWishCode,
                                    sendManEmail);
                        }
                        System.out.println("发送邮件给发件人成功！");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }).start();
        }
    }

    @RequestMapping("/bestwish/envelope/exist")
    public void hasEnvelopeByWishCode(HttpServletRequest request,HttpServletResponse response) throws Exception {
        EnvelopeCustom envelopeCustom = SimpleBeanUtils.setMapPropertyToBean(EnvelopeCustom.class,request.getParameterMap());
        String wishCode = envelopeCustom.getWishCode();
        boolean hasEnvelope = envelopeService.hasEnvelopeByWishCode(wishCode);
        SimpleException.sendMessage(response,objectMapper,"hasEnvelope",String.valueOf(hasEnvelope));
    }
}
