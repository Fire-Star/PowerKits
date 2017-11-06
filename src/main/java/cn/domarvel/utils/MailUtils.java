package cn.domarvel.utils;

import cn.domarvel.exception.SimpleException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 3:55
 */
public class MailUtils {

    private static final String USERNAME = "18382949073@163.com";
    private static final String VERIFYPASS = "joy1998";

    public static void sendEasyMail(String subject,String message,String ...receiveMans) throws SimpleException {
        /*
         * 1. 得到session
         */
        Properties props = new Properties();
        props.setProperty("mail.host", "smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, VERIFYPASS);
            }
        };

        Session session = Session.getInstance(props, auth);
        try{
            /*
         * 2. 创建MimeMessage
         */
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(USERNAME));//设置发件人
            for (String receiveMan : receiveMans) {
                msg.setRecipients(Message.RecipientType.TO, receiveMan);//设置收件人
            }

            msg.setSubject(subject);
            msg.setContent(message, "text/html;charset=utf-8");

        /*
         * 3. 发
         */
            Transport.send(msg);
        }catch (MessagingException e){
            e.printStackTrace();
            throw new SimpleException("邮件发送失败！");
        }
    }
}
