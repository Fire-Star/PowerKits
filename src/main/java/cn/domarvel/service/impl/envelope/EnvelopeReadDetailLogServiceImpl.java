package cn.domarvel.service.impl.envelope;

import cn.domarvel.dao.envelopedao.EnvelopeReadDetailLogMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.EnvelopeReadDetailLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadDetailLogService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/8
 * Time: 14:31
 */
@Service
public class EnvelopeReadDetailLogServiceImpl implements EnvelopeReadDetailLogService{

    @Autowired
    private EnvelopeReadDetailLogMapper envelopeReadDetailLogMapper;

    @Override
    public void saveEnvelopeReadDetailLog(EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(envelopeReadDetailLogCustom);

        envelopeReadDetailLogMapper.saveEnvelopeReadDetailLog(envelopeReadDetailLogCustom);
    }

    @Override
    public List<EnvelopeReadDetailLogCustom> findEnvelopeReadDetailLogByWishCodeAndIP(String wishCode, String IP) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"查询阅读日志时【祝福码】");
        IP = BeanPropertyValidateUtils.validateStrIsEmpty(IP,"查询阅读日志时【IP】");
        EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom = new EnvelopeReadDetailLogCustom();
        envelopeReadDetailLogCustom.setWishCode(wishCode);
        envelopeReadDetailLogCustom.setIP(IP);
        List<EnvelopeReadDetailLogCustom> result = envelopeReadDetailLogMapper.findEnvelopeReadDetailLogByWishCodeAndIP(envelopeReadDetailLogCustom);
        if(result == null){
            throw new SimpleException("当前【IP】，没有对该【祝福码】信件进行阅读！");
        }
        return result;
    }
}
