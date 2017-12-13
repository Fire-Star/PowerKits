package cn.domarvel.service.impl.luckmoney;

import cn.domarvel.dao.luckmoney.LuckMoneyMapper;
import cn.domarvel.pocustom.luckmoney.LuckMoneyLogCustom;
import cn.domarvel.service.luckmoney.LuckMoneyLogService;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/12/13
 * Time: 17:15
 */
@Service
public class LuckMoneyLogServiceImpl implements LuckMoneyLogService{
    @Autowired
    private LuckMoneyMapper luckMoneyMapper;

    @Override
    public Integer count() throws Exception {
        return luckMoneyMapper.count();
    }

    @Override
    public void addCountByIP(LuckMoneyLogCustom logCustom) throws Exception {
        String ip = logCustom.getIp();
        BeanPropertyValidateUtils.validateStrIsEmpty(ip,"统计红包推广页访问量的访问IP");
        try {
            luckMoneyMapper.insert(logCustom);
        }catch (Exception e){
            luckMoneyMapper.update(logCustom);
        }
    }
}
