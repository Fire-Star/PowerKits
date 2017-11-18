package cn.domarvel.utils;

import cn.domarvel.exception.SimpleException;
import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.security.Security;
import java.util.Date;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 3:55
 */
public class MailUtils {

    private static final String USERNAME = "18382949073@163.com";
    private static final String VERIFYPASS = "joy1998";

    /**
     * 由于 现在购买的服务器都 限制了25端口，所以我们需要转到 ssl 的 465 端口
     * @param subject
     * @param message
     * @param receiveMans
     * @throws SimpleException
     */
    public static void sendEasyMail(String subject,String message,String ...receiveMans) throws SimpleException {
        /*
         * 1. 得到session
         */
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        Properties props = new Properties();
        props.setProperty("mail.host", "smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "994");
        props.setProperty("mail.smtp.socketFactory.port", "994");

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
            msg.setRecipients(Message.RecipientType.CC,InternetAddress.parse(USERNAME));
            for (String receiveMan : receiveMans) {
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveMan));//设置收件人
            }

            msg.setSubject(subject);
            msg.setContent(message, "text/html;charset=utf-8");
            msg.setSentDate(new Date());
        /*
         * 3. 发
         */
            Transport.send(msg);

        }catch (MessagingException e){
            e.printStackTrace();
            throw new SimpleException("邮件发送失败！");
        }
    }
    public static void main(String[] args){
        int repeatCount = 100000; //十万
        while (repeatCount-- > 0){
            try {
                HttpClient httpClient = HttpClientBuilder.create().build();
                HttpGet httpGet = new HttpGet("http://116.196.93.48/test/alert.php");
                httpGet.setHeader("Cookie","is_write=Y");
                HttpEntity httpEntity = httpClient.execute(httpGet).getEntity();
                System.out.println(EntityUtils.toString(httpEntity));
            }catch (Exception e){
                System.out.println("又被防火墙阻断了！！！");
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException e1) {
                    System.out.println("休眠失败！！！");
                }
            }
        }
    }
}
