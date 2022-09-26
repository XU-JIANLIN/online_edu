package com.online.edu.vodservice.controller;

import ch.qos.logback.core.pattern.util.RegularEscapeUtil;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.vodservice.service.VideoService;
import com.online.edu.vodservice.utils.AliyunVodSDKUtils;
import com.online.edu.vodservice.utils.ConstantPropertiesUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@RestController
@RequestMapping("/vidservice/vod")
@CrossOrigin
@Slf4j
public class VideoAdminController {

    @Autowired
    private  VideoService videoService;

    @GetMapping("getPlayAuth/{videoId}")
    public ResultVO getVideoPlayAuth(@PathVariable("videoId") String videoId) throws Exception {

        //获取阿里云存储相关常量
        String accessKeyId = ConstantPropertiesUtil.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertiesUtil.ACCESS_KEY_SECRET;

        //初始化
        DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(accessKeyId, accessKeySecret);

        //请求
        GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
        request.setVideoId(videoId);

        //响应
        GetVideoPlayAuthResponse response = client.getAcsResponse(request);

        //得到播放凭证
        String playAuth = response.getPlayAuth();

        //返回结果
        return ResultVOUtil.success("playAuth", playAuth);

    }


    //删除阿里云多个视频
    //参数是多个视频id的list集合
    @DeleteMapping("removeMoreVideo")
    public ResultVO deleteMoreVideo(@RequestParam("videoList") List videoList) {
        videoService.deleteVideoMore(videoList);
        return ResultVOUtil.success();
    }


    //实现删除云端视频的方法
    @DeleteMapping("{videoId}")
    public ResultVO deleteVideoIdAliyun(@PathVariable String videoId) {
        log.info("【删除阿里云视频】 删除视频id为" + videoId + "的视频");
        videoService.deleteAliyunVideoId(videoId);
        return ResultVOUtil.success();
    }
    //实现上传视频到阿里云服务器的方法
    @PostMapping("upload")
    public ResultVO uploadAliyunVideo(@RequestParam("file") MultipartFile file) {
        //调用方法实现视频上传，返回上传之后视频id
        String videoId = videoService.uploadVideo(file);
        return ResultVOUtil.success("videoId",videoId);
    }

}
