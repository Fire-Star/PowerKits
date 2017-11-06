package cn.domarvel.service.envelope;

import cn.domarvel.pocustom.EnvelopeCustom;

public interface EnvelopeService {
    /**
     * 保存信到服务器，由服务器管理
     * @param envelopeCustom
     * @throws Exception
     */
    public void sendEnvelope(EnvelopeCustom envelopeCustom) throws Exception;

    public EnvelopeCustom findEnvelopeByWishCode(String wishCode) throws Exception;
}
