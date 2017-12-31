package cn.domarvel.utils;

import org.apache.commons.codec.binary.Base64;
import org.springframework.security.crypto.codec.Hex;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 12/30/2017
 * Time: 9:15 PM
 */
public class RSAUtils {
    private static RSAPublicKey rsaPublicKey;
    private static RSAPrivateKey rsaPrivateKey;

    static {
        //初始化RSA
        KeyPairGenerator keyPairGenerator = null;
        try {
            keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        } catch (NoSuchAlgorithmException e) {
            System.out.println("当前Java版本不支持该加密算法。");
            e.printStackTrace();
        }
        keyPairGenerator.initialize(512,new SecureRandom());
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        rsaPublicKey = (RSAPublicKey)keyPair.getPublic();
        rsaPrivateKey = (RSAPrivateKey)keyPair.getPrivate();
    }

    public static String getJsonRSAPublicKey(){
        return "({'expont':'"+rsaPublicKey.getPublicExponent().toString()+"';'modolu':'"+rsaPublicKey.getModulus().toString()+"')}";
    }
    /**
     * 解密
     * @param hexSource
     * @return
     */
    public static String decode(String hexSource){
        byte[] rsaEncodePassword = Hex.decode(hexSource);

        //私钥解密
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(rsaPrivateKey.getEncoded());
        KeyFactory keyFactory = null;
        byte[] decodedPassword = null;
        try {
            keyFactory = KeyFactory.getInstance("RSA");
            PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.DECRYPT_MODE,privateKey);
            decodedPassword = cipher.doFinal(rsaEncodePassword);
        } catch (NoSuchAlgorithmException e) {
            System.out.println("当前Java版本不支持该加密算法。");
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            System.out.println("不可用的密匙！");
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            System.out.println("明文已经损坏！");
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        }
        return new String(decodedPassword);
    }

    public static String encode(String source){
        //公钥加密
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(rsaPublicKey.getEncoded());
        KeyFactory keyFactory = null;
        byte [] result = null;
        try {
            keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
            Cipher cipher1 = Cipher.getInstance("RSA");
            cipher1.init(Cipher.ENCRYPT_MODE,publicKey);
            result = cipher1.doFinal(source.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        }
        return  String.valueOf(Hex.encode(result));
    }
}
