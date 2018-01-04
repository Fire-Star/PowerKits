package cn.domarvel.service.user;

import cn.domarvel.pocustom.user.UserCustomx;

import java.util.Map;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/5/2018
 * @Time: 12:04 AM
 */
public interface RegisterService {
    public void insertUser(UserCustomx userCustom) throws Exception;
    public Integer findUserCountByUserName(String username) throws Exception;
    public void register(UserCustomx userCustom, Map<String,String> keyPair, String initSalt) throws Exception;
}
