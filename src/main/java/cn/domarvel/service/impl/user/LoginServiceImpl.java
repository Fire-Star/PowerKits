package cn.domarvel.service.impl.user;

import cn.domarvel.dao.user.UserxMapper;
import cn.domarvel.pocustom.user.UserCustomx;
import cn.domarvel.service.user.LoginService;
import cn.domarvel.service.user.RegisterService;
import cn.domarvel.utils.BCrypt;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.RSAUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/5/2018
 * @Time: 3:32 AM
 */
@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private UserxMapper userxMapper;

    @Autowired
    private RegisterService registerService;

    @Override
    public String findUserInitSaltByUserName(String username) throws Exception {
        BeanPropertyValidateUtils.validateStrIsEmpty(username,"登录时用户名");
        return userxMapper.findUserInitSaltByUserName(username);
    }

    @Override
    public UserCustomx findUserByUsername(String username) throws Exception {
        BeanPropertyValidateUtils.validateStrIsEmpty(username,"用户名");
        return userxMapper.findUserByUsername(username);
    }

    @Override
    public boolean login(UserCustomx loginUserCustomx, Map<String,String> keyPair) throws Exception {
        boolean flag = false;
        String loginUsername = loginUserCustomx.getUsername();
        String loginPassword = loginUserCustomx.getPassword();
        BeanPropertyValidateUtils.validateStrIsEmpty(loginUsername,"用户名");
        BeanPropertyValidateUtils.validateStrIsEmpty(loginPassword,"密码");

        String decodePassword = RSAUtils.decode(loginPassword,keyPair.get(RSAUtils.PRIVATE_KEY_NAME));
        UserCustomx dataBaseUserCustomx = findUserByUsername(loginUsername);
        flag = BCrypt.checkpw(decodePassword,dataBaseUserCustomx.getPassword());
        System.out.println(flag);
        return flag;
    }


}
