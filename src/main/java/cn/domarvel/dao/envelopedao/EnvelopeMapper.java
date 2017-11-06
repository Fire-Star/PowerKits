package cn.domarvel.dao.envelopedao;

import cn.domarvel.pocustom.EnvelopeCustom;


/**
 * Created by Administrator on 2017/8/10.
 */
public interface EnvelopeMapper {
    public void saveEnvelope(EnvelopeCustom envelopeCustom);

    public Integer countEnvelopeByWishCode(String wishCode);

    public EnvelopeCustom findEnvelopeByWishCode(String wishCode);
}
