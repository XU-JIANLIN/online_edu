package com.online.edu.vodservice.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface VideoService {

    //上传阿里云视频
	String uploadVideo(MultipartFile file);

	//删除阿里云视频
    void deleteAliyunVideoId(String videoId) ;

    void deleteVideoMore(List videoList);
}