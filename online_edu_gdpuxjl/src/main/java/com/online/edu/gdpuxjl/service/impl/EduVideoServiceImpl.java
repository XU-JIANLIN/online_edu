package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.online.edu.gdpuxjl.client.VideoCilent;
import com.online.edu.gdpuxjl.pojo.EduVideo;
import com.online.edu.gdpuxjl.mapper.EduVideoMapper;
import com.online.edu.gdpuxjl.service.EduVideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@Service
public class EduVideoServiceImpl extends ServiceImpl<EduVideoMapper, EduVideo> implements EduVideoService {


    @Autowired
    private VideoCilent videoCilent;
    //根据课程id删除小节
    @Override
    public void deleteVideoByCourseId(String id) {

        //把课程里面所有的视频都进行删除
        //1 获取课程里面所有的视频id
        //根据课程id查询课程所有的小节中视频id
        QueryWrapper<EduVideo> wrapperVideo = new QueryWrapper<>();
        wrapperVideo.eq("course_id",id);
        //只是查询视频id字段，其他字段不查询
        wrapperVideo.select("video_source_id");
        List<EduVideo> eduVideos = baseMapper.selectList(wrapperVideo);

        if (!eduVideos.isEmpty()){
            //把查询出来集合里面视频id值获取出来，构建新list集合
            List<String> videoIdList = new ArrayList<>();
            for (int i = 0; i < eduVideos.size(); i++) {
                //获取每个小节
                EduVideo eduVideo = eduVideos.get(i);
                //每个小节获取视频id
                String videoSourceId = eduVideo.getVideoSourceId();
                //放到list集合
                videoIdList.add(videoSourceId);
                //2 调用方法进行删除
                videoCilent.removeMoreVideoAlihyun(videoIdList);
        }

        }
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",id);
        baseMapper.delete(wrapper);

    }

    //删除小节的方法
    @Override
    public boolean removeVideo(String videoId) {

        //TODO 删除小节时候，还要删除阿里云视频，后面完善
        //完善TODO : 根据小节ID查出阿里云视频id，并且删除。

        EduVideo eduVideo = baseMapper.selectById(videoId);
        String videoSourceId = eduVideo.getVideoSourceId();

        //如果该视频id不为空时，调用阿里云删除视频方法
        if (!StringUtils.isEmpty(videoSourceId)){
            videoCilent.removeVideo(videoSourceId);
        }

        int result = baseMapper.deleteById(videoId);
        return result>0;
    }
}
