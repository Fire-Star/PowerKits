package cn.domarvel.web.controller.encodeController;

import cn.domarvel.utils.RSAUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 12/31/2017
 * Time: 12:01 PM
 */
@Controller
public class RSAController {

    @RequestMapping("/encode/jsonpublicrsakey")
    public @ResponseBody String getPublicRsaKey(){
        String publicKey = RSAUtils.getJsonRSAPublicKey();
        return publicKey;
    }
}
