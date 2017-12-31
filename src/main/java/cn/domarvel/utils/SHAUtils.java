package cn.domarvel.utils;

import cn.domarvel.web.controller.loginAndRegisterController.RegisterController;
import org.apache.commons.codec.binary.Base64;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 12/30/2017
 * Time: 9:46 PM
 */
public class SHAUtils {

    public static String SHA512(final String strText) {
        return SHA(strText, "SHA-512");
    }
    public static String SHA256(final String strText) {
        return SHA(strText, "SHA-256");
    }
    /**
     * 字符串 SHA 加密
     * @param strText
     * @param strType
     * @return
     */
    private static String SHA(final String strText, final String strType) {
        // 返回值
        String strResult = null;
        byte[] byteBuffer = null;
        // 是否是有效字符串
        if (strText != null && strText.length() > 0)
        {
            try
            {
                // SHA 加密开始
                // 创建加密对象 并傳入加密類型
                MessageDigest messageDigest = MessageDigest.getInstance(strType);
                // 传入要加密的字符串
                messageDigest.update(strText.getBytes());
                // 得到 byte 類型结果
                byteBuffer = messageDigest.digest();

                // 將 byte 轉換爲 string
                StringBuffer strHexString = new StringBuffer();
                // 遍歷 byte buffer
                for (int i = 0; i < byteBuffer.length; i++)
                {
                    String hex = Integer.toHexString(0xff & byteBuffer[i]);
                    if (hex.length() == 1)
                    {
                        strHexString.append('0');
                    }
                    strHexString.append(hex);
                }
                // 得到返回結果
                strResult = strHexString.toString();
            }
            catch (NoSuchAlgorithmException e)
            {
                e.printStackTrace();
            }
        }
        return strResult;
    }
    public static void main(String[] args) {
        String password = "123456";

        System.out.println(SHA512(password));
        String salt = null;
        String encodePass = null;
        String loginEncodePass = null;

        String databaseEncodePass = null;
        String databaseSalt = null;
        //注册
        {
            //模拟客户端加密

            //从服务端获取RSA公钥
            //从服务端获取盐
            salt = BCrypt.gensalt();
            //用户输入密码，进行加密
            encodePass = BCrypt.hashpw(SHA512(password),salt);
            //获取RSA公钥加密，对encodePass进行加密

            //假如这是注册传输过程
            //这个传输过程被RSA保护，所以还要用RSA公钥

            //到达服务器后，服务器通过RSA私钥进行解密，然后存储解密后的数据（盐、encodePass）
            databaseEncodePass = encodePass;
            databaseSalt = salt;
        }

        //登录
        {
            //用户输入密码，进行加密

            //获取数据库得盐
            String dataSalt = salt;
            //进行初次加密
            loginEncodePass = BCrypt.hashpw(SHA512(password),salt);

            //为了保证每次登录传输数据都不一样，每次客户端还要生成盐再次加密。
            //客户端生成盐
            String clientSalt = "abcdef";//随机
            String reEncodePass = SHA512(loginEncodePass+clientSalt);

            //这是登录数据传输过程，通过RSA公钥解密

            //到达服务端后
            //获取服务端加密数据，然后通过客户端传输过来的随机盐进行SHA512进行加密
            String redatabaseEncodePass = SHA512(databaseEncodePass+clientSalt);

            //进行客户端传输过来的reEncodePass 和 服务端的redatabaseEncodepass 进行比对。

            System.out.println(redatabaseEncodePass.equals(reEncodePass));
        }

    }
}
