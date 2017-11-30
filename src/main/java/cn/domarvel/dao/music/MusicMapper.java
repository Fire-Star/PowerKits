package cn.domarvel.dao.music;


import cn.domarvel.pocustom.music.MusicCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface MusicMapper {
    public List<MusicCustom> findAll() throws Exception;

    public void insert(MusicCustom musicCustom) throws Exception;

    public void delete(String musicName) throws Exception;
}
