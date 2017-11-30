package cn.domarvel.service.envelope;

import cn.domarvel.pocustom.envelope.EnvelopeCustom;

public interface EnvelopeService {
    /**
     * 保存信到服务器，由服务器管理
     * @param envelopeCustom
     * @throws Exception
     */
    public String sendEnvelope(EnvelopeCustom envelopeCustom) throws Exception;

    public EnvelopeCustom findEnvelopeByWishCode(String wishCode, String remoteIP, boolean edit) throws Exception;

    public String findSendManEmailByWishCode(String wishCode) throws Exception;

    public String findReceiveManEmailByWishCode(String wishCode) throws Exception;

    public String updateEnvelope(EnvelopeCustom envelopeCustom) throws Exception;

    public boolean hasEnvelopeByWishCode(String wishCode) throws Exception;
}
