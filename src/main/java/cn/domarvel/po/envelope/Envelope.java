package cn.domarvel.po.envelope;

import cn.domarvel.annotations.BeanPropertyErrorType;

import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/5
 * Time: 18:06
 */
public class Envelope {
    @BeanPropertyErrorType(propertyName = "祝福码")
    private String wishCode;//唯一祝福码
    @BeanPropertyErrorType(propertyName = "收信人")
    private String receiveMan;//收信人
    @BeanPropertyErrorType(propertyName = "信件的目的")
    private  String envelopeAim;//这封信的目的
    @BeanPropertyErrorType(propertyName = "寄件人")
    private String sendMan;//寄件人
    @BeanPropertyErrorType(propertyName = "致 谁谁谁")
    private String dearMan;//致 谁谁谁
    private String message;//信的内容
    private String stamp;//邮票

    @Override
    public String toString() {
        return "{" +
                "wishCode:'" + wishCode + '\'' +
                ", receiveMan:'" + receiveMan + '\'' +
                ", envelopeAim:'" + envelopeAim + '\'' +
                ", sendMan:'" + sendMan + '\'' +
                ", dearMan:'" + dearMan + '\'' +
                ", message:'" + message + '\'' +
                ", stamp:'" + stamp + '\'' +
                '}';
    }

    public String getStamp() {
        return stamp;
    }

    public void setStamp(String stamp) {
        this.stamp = stamp;
    }

    public String getWishCode() {
        return wishCode;
    }

    public void setWishCode(String wishCode) {
        this.wishCode = wishCode;
    }

    public String getReceiveMan() {
        return receiveMan;
    }

    public void setReceiveMan(String receiveMan) {
        this.receiveMan = receiveMan;
    }

    public String getEnvelopeAim() {
        return envelopeAim;
    }

    public void setEnvelopeAim(String envelopeAim) {
        this.envelopeAim = envelopeAim;
    }

    public String getSendMan() {
        return sendMan;
    }

    public void setSendMan(String sendMan) {
        this.sendMan = sendMan;
    }

    public String getDearMan() {
        return dearMan;
    }

    public void setDearMan(String dearMan) {
        this.dearMan = dearMan;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
