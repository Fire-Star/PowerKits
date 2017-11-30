package cn.domarvel.service.music;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MusicServer {
    public String upload(MultipartFile file, String uploadDir) throws Exception;

    public List<String> getMusicNames(String basePath) throws Exception;
}
