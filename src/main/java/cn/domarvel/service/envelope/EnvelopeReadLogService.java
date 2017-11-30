package cn.domarvel.service.envelope;

import cn.domarvel.pocustom.envelope.EnvelopeReadLogCustom;

import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/7
 * Time: 3:14
 */
public interface EnvelopeReadLogService {
    public void saveEnvelopeReadLog(EnvelopeReadLogCustom envelopeReadLogCustom) throws Exception;

    public List<EnvelopeReadLogCustom> findEnvelopeReadLogsByWishCode(String wishCode) throws Exception;
}
