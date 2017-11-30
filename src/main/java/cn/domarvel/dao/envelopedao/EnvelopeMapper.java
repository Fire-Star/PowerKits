package cn.domarvel.dao.envelopedao;

import cn.domarvel.pocustom.envelope.EnvelopeCustom;


/**
 * Created by Administrator on 2017/8/10.
 */
public interface EnvelopeMapper {
    public void saveEnvelope(EnvelopeCustom envelopeCustom);

    public Integer countEnvelopeByWishCode(String wishCode);

    public EnvelopeCustom findEnvelopeByWishCode(String wishCode);

    public String findSendManEmailByWishCode(String wishCode);

    public String findReceiveManEmailByWishCode(String wishCode);

    public void updateEnvelope(EnvelopeCustom envelopeCustom);
}
