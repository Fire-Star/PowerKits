package cn.domarvel.web.controller.musicController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.pocustom.music.MusicCustom;
import cn.domarvel.service.music.MusicServer;
import cn.domarvel.utils.BeanPropertyValidateUtils;
import cn.domarvel.utils.SimpleBeanUtils;
import cn.domarvel.vo.music.MusicVo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Create by MoonFollow (or named FireLang)
 * Only For You , Joy
 * Date: 2017/11/29
 * Time: 10:16
 */
@Controller
public class MusicController {

    private String uploadDir;//上传文件路径

    @Autowired
    private MusicServer musicService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping("/music/index")
    public String index(){
        return "/WEB-INF/pages/music/index.jsp";
    }

    @RequestMapping("/music/outlink")
    public String outLink(HttpServletResponse response){
        return "/WEB-INF/pages/music/outlink.jsp";
    }

    @RequestMapping("/music/musicwarehouse")
    public String musicWarehouse(){
        return "/WEB-INF/pages/music/musicsManage.jsp";
    }

    @RequestMapping("/music/upload")
    public String uploadFileAndInsert(@RequestParam("musicFile") MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws Exception{
        String musicName = null;
        if(uploadDir == null || uploadDir.equals("")){
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            setUploadDir(rootPath +"res"+File.separator+"music"+ File.separator);
        }
        if(!file.isEmpty()) {
            musicName = musicService.upload(file,uploadDir);//文件上传到指定目录
            //插入音乐上传日志记录
            String remoteIP = request.getRemoteAddr();
            MusicCustom musicCustom = new MusicCustom();
            musicCustom.setName(musicName);
            musicCustom.setUploadRemoteIP(remoteIP);
            musicCustom.setUploadTime(new Date());
            try {
                musicService.insert(musicCustom);
            }catch (Exception e){
            }
        }
        request.setAttribute("musicName",musicName);
        request.setAttribute("errorType","errorType");
        return "/WEB-INF/pages/music/iframeMusic.jsp";
    }

    @RequestMapping("/music/showallmusic")
    public void findAll(HttpServletResponse response) throws Exception {
        List<MusicVo> musics = musicService.findAll();

        SimpleException.sendMessage(response,objectMapper,musics);
    }

    @RequestMapping("/music/delete")
    public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
        MusicCustom musicCustom = SimpleBeanUtils.setMapPropertyToBean(MusicCustom.class,request.getParameterMap());
        String name = musicCustom.getName();

        musicService.delete(name,uploadDir , request.getRemoteAddr());
        SimpleException.sendMessage(response,objectMapper,"删除成功！");
    }


    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}
