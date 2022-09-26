package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.online.edu.common.dto.EduChapterDTO;
import com.online.edu.common.dto.EduVideoDTO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.gdpuxjl.pojo.EduChapter;
import com.online.edu.gdpuxjl.mapper.EduChapterMapper;
import com.online.edu.gdpuxjl.pojo.EduVideo;
import com.online.edu.gdpuxjl.service.EduChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.online.edu.gdpuxjl.service.EduVideoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements EduChapterService {

    @Autowired
    private EduVideoService eduVideoService;

    //根据课程id删除章节
    @Override
    public void deleteChapterByCourseId(String id) {
        QueryWrapper<EduChapter> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",id);
        baseMapper.delete(wrapper);
    }

    //根据课程id查询章节和小节数据
    @Override
    public List<EduChapterDTO> getChapterVideoListByCourseId(String courseId) {
        //1 根据课程id查询章节
        QueryWrapper<EduChapter> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        List<EduChapter> eduChapters = baseMapper.selectList(wrapper);

        //2 根据课程id查询小节
        QueryWrapper<EduVideo> wrapperVideo = new QueryWrapper<>();
        wrapperVideo.eq("course_id",courseId);
        List<EduVideo> eduVideos = eduVideoService.list(wrapperVideo);

        //用于存储章节和小节数据
        List<EduChapterDTO> chapterDtoList = new ArrayList<>();
        //3 遍历所有的章节，复制值到dto对象里面
        for (int i = 0; i < eduChapters.size(); i++) {
            //获取每个章节
            EduChapter chapter = eduChapters.get(i);
            //复制值到dto对象里面
            EduChapterDTO eduChapterDto = new EduChapterDTO();
            BeanUtils.copyProperties(chapter,eduChapterDto);
            //dto对象放到list集合里面
            chapterDtoList.add(eduChapterDto);

            //创建集合用于存储所有的小节数据
            List<EduVideoDTO> eduVideoDtoList = new ArrayList<>();
            //构建小节数据
            //4 遍历小节
            for (int m = 0;m < eduVideos.size();m++) {
                //获取每个小节
                EduVideo video = eduVideos.get(m);
                //判断小节chapterid和章节id是否一样
                if(video.getChapterId().equals(chapter.getId())) {
                    //转换dto对象
                    EduVideoDTO eduVideoDto = new EduVideoDTO();
                    BeanUtils.copyProperties(video,eduVideoDto);
                    //dto对象放到list集合
                    eduVideoDtoList.add(eduVideoDto);
                }
            }
            //把小节最终放到每个章节里面
            eduChapterDto.setChildren(eduVideoDtoList);
        }
        //返回集合
        return chapterDtoList;
    }

    //删除章节
    @Override
    public boolean removeChapterId(String chapterId) {
        //判断章节里面是否有小节
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("chapter_id",chapterId);
        int count = eduVideoService.count(wrapper);
        //如果有小节不进行删除，
        if(count>0) {
            throw new EduException(ResultEnum.DELETE_CHAPTER_FALSE);
        }
        //没有才进行章节删除
        int result = baseMapper.deleteById(chapterId);
        return result>0;
    }
}
