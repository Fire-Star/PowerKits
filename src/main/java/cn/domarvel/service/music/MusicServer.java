package cn.domarvel.service.music;

import cn.domarvel.pocustom.music.MusicCustom;
import cn.domarvel.vo.music.MusicVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MusicServer {
    public String upload(MultipartFile file, String uploadDir) throws Exception;

    public List<MusicVo> findAll() throws Exception;

    public void insert(MusicCustom musicCustom) throws Exception;

    public void delete(String musicName ,String bathDir) throws Exception;
}
