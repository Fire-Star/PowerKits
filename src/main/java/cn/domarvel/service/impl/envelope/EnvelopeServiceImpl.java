package cn.domarvel.service.impl.envelope;

import cn.domarvel.dao.envelopedao.EnvelopeMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/5
 * Time: 18:42
 */
@Service
public class EnvelopeServiceImpl implements EnvelopeService{

    @Autowired
    private EnvelopeMapper envelopeMapper;

    private static final String EMAIL_REGEX = "^(?:\\w+)[(?:\\.[-\\w]+)(?:[-\\w]+)]*@(?:[a-zA-Z0-9]+)(?:-[a-zA-Z0-9]+)*(?:\\.[a-zA-Z0-9]+)+$";


    /**
     * 保存 envelope
     * @param envelopeCustom
     * @throws Exception
     */
    @Override
    public void sendEnvelope(EnvelopeCustom envelopeCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(envelopeCustom);

        String receiveManEmail = envelopeCustom.getReceiveManEmail();
        String sendManEmail = envelopeCustom.getSendManEmail();
        if(!receiveManEmail.matches(EMAIL_REGEX)){
            throw new SimpleException("收件人邮件地址，不是一个正确的邮件地址！");
        }
        if(!sendManEmail.matches(EMAIL_REGEX)){
            throw new SimpleException("发件人邮件地址，不是一个正确的邮件地址！");
        }

        String message = envelopeCustom.getMessage();
        if("".equals(message)){
            throw new SimpleException("【信件内容】不能为空！");
        }

        //判断是否重复，通过唯一祝福码
        Integer envelopeCount = envelopeMapper.countEnvelopeByWishCode(envelopeCustom.getWishCode());
        if(envelopeCount >= 1){
            throw new SimpleException("祝福码【"+envelopeCustom.getWishCode()+"】已经存在！");
        }

        envelopeMapper.saveEnvelope(envelopeCustom);
    }

    /**
     * 通过 祝福码 查找 信
     * @param wishCode
     * @return
     * @throws Exception
     */
    @Override
    public EnvelopeCustom findEnvelopeByWishCode(String wishCode) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"祝福码");
        EnvelopeCustom envelopeCustom = envelopeMapper.findEnvelopeByWishCode(wishCode);
        if(envelopeCustom == null){
            throw new SimpleException("Sorry 该唯一祝福码下没有你要找的信！");
        }
        return envelopeCustom;
    }

    @Override
    public String findSendManEmailByWishCode(String wishCode) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"查找该祝福码的发件人邮箱时，祝福码");
        return envelopeMapper.findSendManEmailByWishCode(wishCode);
    }

    @Override
    public String findReceiveManEmailByWishCode(String wishCode) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"查找该祝福码的收件人邮箱时，祝福码");
        return envelopeMapper.findReceiveManEmailByWishCode(wishCode);
    }
}
