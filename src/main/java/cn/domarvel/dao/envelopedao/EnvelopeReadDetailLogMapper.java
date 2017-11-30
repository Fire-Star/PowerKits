package cn.domarvel.dao.envelopedao;

import cn.domarvel.pocustom.envelope.EnvelopeReadDetailLogCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface EnvelopeReadDetailLogMapper {
    public void saveEnvelopeReadDetailLog(EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom);

    public List<EnvelopeReadDetailLogCustom> findEnvelopeReadDetailLogByWishCodeAndIP(EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom);
}
