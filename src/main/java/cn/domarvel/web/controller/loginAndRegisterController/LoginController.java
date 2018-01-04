package cn.domarvel.web.controller.loginAndRegisterController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.user.UserCustomx;
import cn.domarvel.service.user.LoginService;
import cn.domarvel.utils.SimpleBeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Author 胡艺宝
 * @Version 1.0
 * @Date: 1/5/2018
 * @Time: 3:24 AM
 */
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping("/user/login/index")
    public String loginIndex(){
        return "/WEB-INF/pages/login.jsp";
    }

    @RequestMapping("/user/initsalt")
    public void findUserInitSalt(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String username = (String) request.getParameter("username");
        System.out.println("username:"+username);
        String salt = loginService.findUserInitSaltByUserName(username);
        if(salt == null){
            throw new SimpleException("你还没有注册呢！");
        }
        SimpleException.sendMessage(response, objectMapper,"salt",salt);
    }

    @RequestMapping("/user/login")
    public void login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
        UserCustomx userCustomx = SimpleBeanUtils.setMapPropertyToBean(UserCustomx.class,request.getParameterMap());
        Map<String,String> keyPair = (Map<String, String>) session.getAttribute(RegisterController.SESSION_KEY_PAIR);
        if(keyPair == null){
            throw new SimpleException("refreshx","true");
        }
        boolean loginState = loginService.login(userCustomx,keyPair);
        String loginStateStr = "账号或密码错误！";
        if(loginState){
            loginStateStr = "登录成功！";
        }
        SimpleException.sendMessage(response,objectMapper,"loginState",loginStateStr);
    }
}
