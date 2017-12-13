package cn.domarvel.service.luckmoney;

import cn.domarvel.pocustom.luckmoney.LuckMoneyLogCustom;

public interface LuckMoneyLogService {
    public Integer count() throws Exception;
    public void addCountByIP(LuckMoneyLogCustom logCustom) throws Exception;
}
