package cn.domarvel.pocustom.user;

import cn.domarvel.po.user.Userx;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/4/2018
 * @Time: 11:54 PM
 */
public class UserCustomx extends Userx {
    /**
     * 写自定义属性
     */
    private String initSalt;

    public String getInitSalt() {
        return initSalt;
    }

    public void setInitSalt(String initSalt) {
        this.initSalt = initSalt;
    }
}
