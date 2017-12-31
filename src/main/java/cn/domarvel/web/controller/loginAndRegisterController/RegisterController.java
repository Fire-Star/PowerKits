package cn.domarvel.web.controller.loginAndRegisterController;

import cn.domarvel.utils.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    private static String source = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM123456789";
    private static int sourceLen = source.length();

    //生成盐
    @RequestMapping("/user/register/randomsalt")
    public static String getRegisterSalt(Integer saltCount){
        Random random = new Random();
        StringBuilder saltStr = new StringBuilder();
        for(int i = 0; i < saltCount; i++){
            saltStr.append(source.charAt(random.nextInt(sourceLen)));
        }
        return saltStr.toString();
    }

    @RequestMapping("/user/register/randombcryptsalt")
    public String getBcryptSalt(){
        return BCrypt.gensalt(5);
    }
}
