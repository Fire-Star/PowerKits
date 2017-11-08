package cn.domarvel.po.envelope;

import cn.domarvel.annotations.BeanPropertyErrorType;

import java.sql.Date;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/8
 * Time: 14:01
 */
public class EnvelopeReadDetailLog {
    private String ID; //唯一UUID
    @BeanPropertyErrorType(propertyName = "远程IP")
    private String IP; //远程IP
    @BeanPropertyErrorType(propertyName = "祝福码")
    private String wishCode; //祝福码
    private Date time; //阅读时间

    public EnvelopeReadDetailLog() {
    }

    @Override
    public String toString() {
        return "EnvelopeReadDetailLog{" +
                "ID='" + ID + '\'' +
                ", IP='" + IP + '\'' +
                ", wishCode='" + wishCode + '\'' +
                ", time=" + time +
                '}';
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getIP() {
        return IP;
    }

    public void setIP(String IP) {
        this.IP = IP;
    }

    public String getWishCode() {
        return wishCode;
    }

    public void setWishCode(String wishCode) {
        this.wishCode = wishCode;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
