package cn.domarvel.service.impl.music;

import cn.domarvel.dao.music.MusicMapper;
import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.music.MusicCustom;
import cn.domarvel.service.music.MusicServer;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.StringUtils;
import cn.domarvel.vo.music.MusicVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.LinkedList;
import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/29
 * Time: 21:58
 */
@Service
public class MusicServiceImpl implements MusicServer{

    private static final int MAX_FILE_SISE = 30720;//最大 30MB

    @Autowired
    private MusicMapper musicMapper;

    public String upload(MultipartFile file,String uploadDir) throws Exception {
        //获取文件类型
        String contentType = file.getContentType();
        contentType = contentType.substring((contentType.indexOf("/")+1));

        if(contentType == null || contentType.equals("") || !contentType.equals("mp3")) {
            //可以对文件类型进行检查
            throw new SimpleException("上传文件类型必须为 mp3 格式！");
        }
        //获取文件名，带扩展名
        String originFileName = file.getOriginalFilename();

        //获取文件大小，单位字节
        long site = file.getSize();
        if(site > MAX_FILE_SISE) {
            //可以对文件大小进行检查
        }

        //构造文件上传后的文件绝对路径，这里取系统时间戳＋文件名作为文件名
        BeanPropertyValidateUtils.validateStrIsEmpty(uploadDir,"文件保存路径");
        String fileName = uploadDir + originFileName;
        try {
            file.transferTo(new File(fileName));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return originFileName;
    }

    @Override
    public List<MusicVo> findAll() throws Exception {
        List<MusicCustom> musicCustoms = musicMapper.findAll();
        if(musicCustoms == null){
            musicCustoms = new LinkedList<>();
        }
        List<MusicVo> result = new LinkedList<>();
        for (MusicCustom musicCustom : musicCustoms) {
            MusicVo temp = new MusicVo();
            temp.setName(musicCustom.getName());
            temp.setUploadRemoteIP(musicCustom.getUploadRemoteIP());
            temp.setEnTime(StringUtils.getEnTime(musicCustom.getUploadTime()));
            result.add(temp);
        }
        return result;
    }

    @Override
    public void insert(MusicCustom musicCustom) throws Exception {
        BeanPropertyValidateUtils.validateIsEmptyProperty(musicCustom);
        if(musicCustom.getUploadTime() == null){
            throw new SimpleException("音乐上传时间不能为空！");
        }
        musicMapper.insert(musicCustom);
    }

    @Override
    public void delete(String musicName ,String bathDir) throws Exception {
        BeanPropertyValidateUtils.validateStrIsEmpty(musicName,"要删除的音乐名称");
        musicMapper.delete(musicName);//删除数据库音频日志
        //删除目标音频文件
        File targetMusicFile = new File(bathDir+musicName);
        targetMusicFile.delete();
    }
}
