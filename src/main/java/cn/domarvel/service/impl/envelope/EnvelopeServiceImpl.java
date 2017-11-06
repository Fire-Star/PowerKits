package cn.domarvel.service.impl.envelope;

import cn.domarvel.dao.envelopedao.EnvelopeMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeCustom;
import cn.domarvel.service.envelope.EnvelopeService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
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

    /**
     * 保存 envelope
     * @param envelopeCustom
     * @throws Exception
     */
    @Override
    public void sendEnvelope(EnvelopeCustom envelopeCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(envelopeCustom);

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
            throw new SimpleException("你输入的祝福码不存在！");
        }
        return envelopeCustom;
    }
}
