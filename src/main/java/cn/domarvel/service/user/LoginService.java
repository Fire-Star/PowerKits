package cn.domarvel.service.user;

import cn.domarvel.pocustom.user.UserCustomx;

import java.util.Map;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/5/2018
 * @Time: 3:31 AM
 */
public interface LoginService {
    public String findUserInitSaltByUserName(String username) throws Exception;

    public UserCustomx findUserByUsername(String username) throws Exception;

    public boolean login(UserCustomx loginUserCustomx, Map<String,String> keyPair) throws Exception;
}
