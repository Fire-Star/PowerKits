package cn.domarvel.po.envelope;

import cn.domarvel.annotations.BeanPropertyErrorType;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 2:51
 */
public class EnvelopeReadLog {
    private String ID;//log 的 ID
    @BeanPropertyErrorType(propertyName = "查看 envelopeReadLog 时 唯一祝福码")
    private String wishCode;//唯一祝福码
    @BeanPropertyErrorType(propertyName = "查看 envelopeReadLog 时 IP")
    private String IP;//远程IP
    private Integer readCount;//相同IP，相同祝福码的阅读次数

    @Override
    public String toString() {
        return "EnvelopeReadLog{" +
                "ID='" + ID + '\'' +
                ", wishCode='" + wishCode + '\'' +
                ", IP='" + IP + '\'' +
                ", readCount=" + readCount +
                '}';
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getWishCode() {
        return wishCode;
    }

    public void setWishCode(String wishCode) {
        this.wishCode = wishCode;
    }

    public String getIP() {
        return IP;
    }

    public void setIP(String IP) {
        this.IP = IP;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }
}
