package cn.domarvel.po.user;

import cn.domarvel.annotations.BeanPropertyErrorType;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/4/2018
 * @Time: 11:53 PM
 */
public class Userx {
    @BeanPropertyErrorType(propertyName = "用户名")
    private String username;
    @BeanPropertyErrorType(propertyName = "密码")
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
