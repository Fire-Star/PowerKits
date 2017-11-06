package cn.domarvel.pocustom;

import cn.domarvel.annotations.BeanPropertyErrorType;
import cn.domarvel.po.envelope.Envelope;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/5
 * Time: 18:36
 */
public class EnvelopeCustom extends Envelope{
    /**
     * 这里面写扩展的属性
     */
    @BeanPropertyErrorType(propertyName = "收件人的邮件地址")
    private String receiveManEmail; //收件人的邮件地址
    @BeanPropertyErrorType(propertyName = "发件人的邮件地址")
    private String sendManEmail; //发件人的邮件地址

    public String getReceiveManEmail() {
        return receiveManEmail;
    }

    public void setReceiveManEmail(String receiveManEmail) {
        this.receiveManEmail = receiveManEmail;
    }

    public String getSendManEmail() {
        return sendManEmail;
    }

    public void setSendManEmail(String sendManEmail) {
        this.sendManEmail = sendManEmail;
    }
}
