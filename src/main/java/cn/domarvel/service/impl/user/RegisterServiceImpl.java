package cn.domarvel.service.impl.user;

import cn.domarvel.dao.user.UserxMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.user.UserCustomx;
import cn.domarvel.service.user.RegisterService;
import cn.domarvel.utils.BCrypt;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.RSAUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Map;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/5/2018
 * @Time: 12:05 AM
 */
@Service
public class RegisterServiceImpl implements RegisterService{

    @Autowired
    private UserxMapper userxMapper;

    @Override
    public void insertUser(UserCustomx userCustom) throws Exception {
        String initSalt = userCustom.getInitSalt();

        BeanPropertyValidateUtils.validateIsEmptyProperty(userCustom);
        BeanPropertyValidateUtils.validateStrIsEmpty(initSalt,"初始化盐");

        Integer userCount = userxMapper.findUserCountByUserName(userCustom.getUsername());
        if(userCount > 0){
            throw new SimpleException("用户已经存在，请重新输入！");
        }
        userxMapper.insert(userCustom);
    }

    @Override
    public Integer findUserCountByUserName(String username) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(username);
        return userxMapper.findUserCountByUserName(username);
    }

    @Override
    public void register(UserCustomx userCustom,Map<String,String> keyPair,String initSalt) throws Exception{
        String decodeStr = RSAUtils.decode(userCustom.getPassword(), keyPair.get(RSAUtils.PRIVATE_KEY_NAME));
        String lastSalt = BCrypt.gensalt(12,new SecureRandom());
        String finalPassword = BCrypt.hashpw(decodeStr,lastSalt);
        userCustom.setInitSalt(initSalt);
        userCustom.setPassword(finalPassword);
        insertUser(userCustom);
    }
}
