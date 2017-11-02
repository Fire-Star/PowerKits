package cn.domarvel.myMediaModel;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/10/29
 * Time: 21:13
 */
public class BrushRequest {
    private String brushURL;//链接地址
    private int brushCount;//刷取次数
    private String uuid;//每一次请求都有一个唯一的请求ID

    public String getUuid() {
        return uuid;
    }

    public BrushRequest() {
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public BrushRequest(String brushURL, int brushCount) {
        this.brushURL = brushURL;
        this.brushCount = brushCount;
    }

    public String getBrushURL() {
        return brushURL;
    }

    public void setBrushURL(String brushURL) {
        this.brushURL = brushURL;
    }

    public int getBrushCount() {
        return brushCount;
    }

    public void setBrushCount(int brushCount) {
        this.brushCount = brushCount;
    }
}
