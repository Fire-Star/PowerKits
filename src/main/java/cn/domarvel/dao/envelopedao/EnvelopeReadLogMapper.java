package cn.domarvel.dao.envelopedao;

import cn.domarvel.pocustom.envelope.EnvelopeReadLogCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface EnvelopeReadLogMapper {
    public void saveEnvelopeReadLog(EnvelopeReadLogCustom envelopeReadLogCustom);

    public Integer findEnvelopeReadCountByWishCodeAndIP(EnvelopeReadLogCustom envelopeReadLogCustom);

    public void updateEnvelopeReadCountByWishCodeAndIP(EnvelopeReadLogCustom envelopeReadLogCustom);

    public List<EnvelopeReadLogCustom> findEnvelopeReadLogsByWishCode(String wishCode);
}
