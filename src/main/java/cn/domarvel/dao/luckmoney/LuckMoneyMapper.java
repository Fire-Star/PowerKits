package cn.domarvel.dao.luckmoney;

import cn.domarvel.pocustom.luckmoney.LuckMoneyLogCustom;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface LuckMoneyMapper {
    public Integer count() throws Exception;
    public void insert(LuckMoneyLogCustom logCustom) throws Exception;
    public void update(LuckMoneyLogCustom logCustom) throws Exception;
}
