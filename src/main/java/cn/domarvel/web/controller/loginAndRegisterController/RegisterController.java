package cn.domarvel.web.controller.loginAndRegisterController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.user.UserCustomx;
import cn.domarvel.service.user.RegisterService;
import cn.domarvel.utils.BCrypt;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.RSAUtils;
import cn.domarvel.utils.SimpleBeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Random;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 12/30/2017
 * Time: 9:08 PM
 */
@Controller
public class RegisterController {
    //生成盐的数据源
    private static String source = "qwertysdfgASDFGHJKLZXCVBNM1hjklzxcvbnm!@#$%^&*()_+uiopa=-{}[]<>?,./;+-`~.QWERTYUIOP23456789";
    private static int sourceLen = source.length();
    private static final int SALT_COUNT = 10;
    public static final String SESSION_KEY_PAIR = "keyPair";
    public static final String SESSION_SALT = "salt";
    public static final String SESSION_PUBLICK_KEY = "publicKey";

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/user/register/index")
    public String registerIndex(){
        return "/WEB-INF/pages/register.jsp";
    }
    //生成盐
    @RequestMapping("/user/register/randomsalt")
    public void getRegisterSalt(HttpServletResponse response,HttpSession session){
        String salt = (String) session.getAttribute(SESSION_SALT);
        if(salt == null){
            Random random = new Random();
            StringBuilder saltStr = new StringBuilder();
            for(int i = 0; i < SALT_COUNT; i++){
                saltStr.append(source.charAt(random.nextInt(sourceLen)));
            }
            salt = saltStr.toString();
        }
        session.setAttribute(SESSION_SALT,salt);
        SimpleException.sendMessage(response,objectMapper,SESSION_SALT,salt);
    }

    @RequestMapping("/rsa/publickey")
    public void getPublicKey(HttpSession session,HttpServletResponse response){
        Map<String,String> keyPair = (Map<String, String>) session.getAttribute(SESSION_KEY_PAIR);
        if(keyPair == null){
            keyPair = RSAUtils.createRSAKeys();
            session.setAttribute(SESSION_KEY_PAIR,keyPair);
        }
        System.out.println(keyPair.get(RSAUtils.PRIVATE_KEY_NAME));
        SimpleException.sendMessage(response,objectMapper,SESSION_PUBLICK_KEY,keyPair.get(RSAUtils.PUBLIC_KEY_NAME));
    }

    @RequestMapping("/user/register")
    public void register(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception {
        UserCustomx userCustom = SimpleBeanUtils.setMapPropertyToBean(UserCustomx.class,request.getParameterMap());
        BeanPropertyValidateUtils.validateIsEmptyProperty(userCustom);
        Map<String,String> keyPair = ((Map<String,String>) session.getAttribute(SESSION_KEY_PAIR));
        String initSalt = (String) session.getAttribute(SESSION_SALT);
        if(keyPair == null || initSalt == null){
            throw new SimpleException("refreshx","true");
        }
        registerService.register(userCustom,keyPair,initSalt);
        SimpleException.sendMessage(response,objectMapper,"注册成功！");
    }
}
