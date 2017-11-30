package cn.domarvel.po.music;


import cn.domarvel.annotations.BeanPropertyErrorType;

import java.util.Date;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/30
 * Time: 15:36
 */
public class Music {
    @BeanPropertyErrorType(propertyName = "音乐名称")
    private String name;
    @BeanPropertyErrorType(propertyName = "远程上传IP")
    private String uploadRemoteIP;

    private Date uploadTime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUploadRemoteIP() {
        return uploadRemoteIP;
    }

    public void setUploadRemoteIP(String uploadRemoteIP) {
        this.uploadRemoteIP = uploadRemoteIP;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
}
