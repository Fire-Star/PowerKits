package cn.domarvel.service.envelope;

import cn.domarvel.pocustom.EnvelopeReadDetailLogCustom;

import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/8
 * Time: 14:30
 */
public interface EnvelopeReadDetailLogService {
    public void saveEnvelopeReadDetailLog(EnvelopeReadDetailLogCustom envelopeReadDetailLogCustom) throws Exception;

    public List<EnvelopeReadDetailLogCustom> findEnvelopeReadDetailLogByWishCodeAndIP(String wishCode, String IP) throws Exception;
}
