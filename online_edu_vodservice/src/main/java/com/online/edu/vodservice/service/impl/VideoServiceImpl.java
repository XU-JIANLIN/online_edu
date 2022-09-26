package com.online.edu.vodservice.service.impl;
import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.DeleteVideoResponse;

import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.vodservice.pojo.AliyunVodFile;
import com.online.edu.vodservice.service.VideoService;
import com.online.edu.vodservice.utils.AliyunVodSDKUtils;
import com.online.edu.vodservice.utils.ConstantPropertiesUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

@Service
@Slf4j
public class VideoServiceImpl implements VideoService {


    @Override
    public String uploadVideo(MultipartFile file) {
        try {
            //获取上传文件名称
            //视频名称.mp4
            String fileName = file.getOriginalFilename();
            String title = fileName.substring(0, fileName.lastIndexOf("."));
            InputStream inputStream = file.getInputStream();

            log.info("【ACCESS_KEY_ID为：】" + ConstantPropertiesUtil.ACCESS_KEY_ID);
            log.info("【ACCESS_KEY_SECRET为：】" + ConstantPropertiesUtil.ACCESS_KEY_SECRET);


            UploadStreamRequest request = new UploadStreamRequest(ConstantPropertiesUtil.ACCESS_KEY_ID, ConstantPropertiesUtil.ACCESS_KEY_SECRET, title, fileName, inputStream);
            UploadVideoImpl uploader = new UploadVideoImpl();
            UploadStreamResponse response = uploader.uploadStream(request);


            String videoId = response.getVideoId();
            if (!response.isSuccess()) {
                String errorMessage = "阿里云上传错误：" + "code：" + response.getCode() + ", message：" + response.getMessage();
                log.warn(errorMessage);
                if(StringUtils.isEmpty(videoId)){
                    throw new EduException(ResultEnum.UP_VIDEO_FALSE);
                }
            }

            return videoId;


        } catch (Exception e) {
            e.printStackTrace();
            throw new EduException(ResultEnum.UP_VIDEO_FALSE);
        }

    }

    //删除阿里云视频
    @Override
    public void deleteAliyunVideoId(String videoId) {
        try {
            //初始化操作
            DefaultAcsClient client =
                    AliyunVodSDKUtils.initVodClient(ConstantPropertiesUtil.ACCESS_KEY_ID, ConstantPropertiesUtil.ACCESS_KEY_SECRET);
            //创建删除视频请求对象
            DeleteVideoRequest request = new DeleteVideoRequest();
            //设置删除视频id
            request.setVideoIds(videoId);
            //调用方法实现删除
            DeleteVideoResponse response = client.getAcsResponse(request);
        }catch(Exception e) {

        }
    }

    @Override
    public void deleteVideoMore(List videoList) {
        try {
            //初始化操作
            DefaultAcsClient client =
                    AliyunVodSDKUtils.initVodClient(ConstantPropertiesUtil.ACCESS_KEY_ID, ConstantPropertiesUtil.ACCESS_KEY_SECRET);
            //创建删除视频请求对象
            DeleteVideoRequest request = new DeleteVideoRequest();
            //设置删除多个视频id
            //videoList集合中多个视频id传递到删除的方法里面
            //把list集合变成 1,2,3
            //join方法里面第一个参数是数组
            //第二个参数 根据什么内容进行分割 ,
            String videoIds = StringUtils.join(videoList.toArray(), ",");
            //多个视频id使用,隔开 1,2,3
            request.setVideoIds(videoIds);
            //调用方法实现删除
            DeleteVideoResponse response = client.getAcsResponse(request);
        }catch(Exception e) {

        }
    }

}
