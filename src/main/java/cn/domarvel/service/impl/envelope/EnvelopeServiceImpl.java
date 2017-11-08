package cn.domarvel.service.impl.envelope;

import cn.domarvel.dao.envelopedao.EnvelopeMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.pocustom.EnvelopeReadDetailLogCustom;
import cn.domarvel.pocustom.EnvelopeReadLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadDetailLogService;
import cn.domarvel.service.envelope.EnvelopeReadLogService;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;


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

    @Autowired
    private EnvelopeReadLogService envelopeReadLogService;

    @Autowired
    private EnvelopeReadDetailLogService envelopeReadDetailLogService;

    public static final String ENVELOPE_SAVE="SAVE";

    public static final String ENVELOPE_UPDATE="UPDATE";

    private static final String EMAIL_REGEX = "^(?:\\w+)[(?:\\.[-\\w]+)(?:[-\\w]+)]*@(?:[a-zA-Z0-9]+)(?:-[a-zA-Z0-9]+)*(?:\\.[a-zA-Z0-9]+)+$";


    /**
     * 保存 envelope
     * @param envelopeCustom
     * @throws Exception
     */
    @Override
    public String sendEnvelope(EnvelopeCustom envelopeCustom) throws Exception {
        return updateEnvelope(envelopeCustom);
    }

    /**
     * 通过 祝福码 查找 信
     * @param wishCode
     * @return
     * @throws Exception
     */
    @Override
    public EnvelopeCustom findEnvelopeByWishCode(String wishCode, String remoteIP, boolean edit) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"祝福码");
        EnvelopeCustom envelopeCustom = envelopeMapper.findEnvelopeByWishCode(wishCode);
        if(envelopeCustom == null){
            throw new SimpleException("Sorry 该唯一祝福码下没有你要找的信！");
        }

        if(!edit){
            //维护阅读访问记录
            EnvelopeReadLogCustom envelopeReadLogCustom = new EnvelopeReadLogCustom();
            envelopeReadLogCustom.setIP(remoteIP);
            envelopeReadLogCustom.setWishCode(wishCode);
            envelopeReadLogService.saveEnvelopeReadLog(envelopeReadLogCustom);

            //维护详细阅读访问记录
            EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom = new EnvelopeReadDetailLogCustom();
            envelopeReadDetailLogCustom.setIP(remoteIP);
            envelopeReadDetailLogCustom.setWishCode(wishCode);
            envelopeReadDetailLogCustom.setTime(new Date(new java.util.Date().getTime()));
            envelopeReadDetailLogService.saveEnvelopeReadDetailLog(envelopeReadDetailLogCustom);
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

    @Override
    public String updateEnvelope(EnvelopeCustom envelopeCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(envelopeCustom);
        String receiveManEmail = envelopeCustom.getReceiveManEmail();
        String sendManEmail = envelopeCustom.getSendManEmail();
        if(!receiveManEmail.matches(EMAIL_REGEX)){
            throw new SimpleException("收件人邮件地址，不是一个正确的邮件地址！");
        }
        if(!sendManEmail.matches(EMAIL_REGEX)){
            throw new SimpleException("发件人邮件地址，不是一个正确的邮件地址！");
        }

        String message = BeanPropertyValidateUtils.validateStrIsEmpty(envelopeCustom.getMessage(),"信件内容");
        envelopeCustom.setMessage(message);

        //判断是否存在，通过唯一祝福码
        Integer envelopeCount = envelopeMapper.countEnvelopeByWishCode(envelopeCustom.getWishCode());
        if(envelopeCount >= 1){
            envelopeMapper.updateEnvelope(envelopeCustom);
            return ENVELOPE_UPDATE;
        }else {
            envelopeMapper.saveEnvelope(envelopeCustom);
            return ENVELOPE_SAVE;
        }
    }

    @Override
    public boolean hasEnvelopeByWishCode(String wishCode) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"当前功能 【祝福码】");
        boolean hasEnvelope = false;
        Integer count = envelopeMapper.countEnvelopeByWishCode(wishCode);
        if(count >= 1){
            hasEnvelope = true;
        }
        return hasEnvelope;
    }


}
