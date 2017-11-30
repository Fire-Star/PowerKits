package cn.domarvel.web.controller.musicController;

import cn.domarvel.exception.SimpleException;
import cn.domarvel.service.impl.music.MusicServiceImpl;
import cn.domarvel.service.music.MusicServer;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

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

    @RequestMapping("/music/upload")
    public String uploadFileAndInsert(@RequestParam("musicFile") MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws Exception{
        String musicName = null;
        if(uploadDir == null || uploadDir.equals("")){
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            setUploadDir(rootPath +"res"+File.separator+"music"+ File.separator);
        }
        if(!file.isEmpty()) {
            musicName = musicService.upload(file,uploadDir);//文件上传到指定目录
        }
        request.setAttribute("musicName",musicName);
        request.setAttribute("errorType","errorType");
        return "/WEB-INF/pages/music/iframeMusic.jsp";
    }

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}
