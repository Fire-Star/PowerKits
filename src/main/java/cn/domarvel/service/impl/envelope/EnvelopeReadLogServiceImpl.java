package cn.domarvel.service.impl.envelope;

import cn.domarvel.dao.envelopedao.EnvelopeReadLogMapper;
import cn.domarvel.pocustom.envelope.EnvelopeReadLogCustom;
import cn.domarvel.service.envelope.EnvelopeReadLogService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 3:16
 */
@Service
public class EnvelopeReadLogServiceImpl implements EnvelopeReadLogService {

    @Autowired
    private EnvelopeReadLogMapper envelopeReadLogMapper;

    @Override
    public void saveEnvelopeReadLog(EnvelopeReadLogCustom envelopeReadLogCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(envelopeReadLogCustom);
        System.out.println(envelopeReadLogCustom);
        Integer readCount = envelopeReadLogMapper.findEnvelopeReadCountByWishCodeAndIP(envelopeReadLogCustom);
        if(readCount == null){//如果 ReadCount 等于 null 那么，就还没有记录当前 IP && 祝福码 的次数
            envelopeReadLogCustom.setReadCount(1);
            envelopeReadLogMapper.saveEnvelopeReadLog(envelopeReadLogCustom);//保存到数据库
        }else{
            envelopeReadLogCustom.setReadCount(++readCount);//自增一
            envelopeReadLogMapper.updateEnvelopeReadCountByWishCodeAndIP(envelopeReadLogCustom);
        }
    }

    @Override
    public List<EnvelopeReadLogCustom> findEnvelopeReadLogsByWishCode(String wishCode) throws Exception {
        wishCode = BeanPropertyValidateUtils.validateStrIsEmpty(wishCode,"查看 当前祝福码 的阅读记录时 ");
        return envelopeReadLogMapper.findEnvelopeReadLogsByWishCode(wishCode);
    }
}
