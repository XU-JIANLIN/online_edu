package com.online.edu.gdpuxjl.service;

import com.online.edu.common.dto.EduChapterDTO;
import com.online.edu.gdpuxjl.pojo.EduChapter;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
public interface EduChapterService extends IService<EduChapter> {

    //根据课程id删除章节
    public void deleteChapterByCourseId(String id) ;

    // 通过章节id删除章节
    boolean removeChapterId(String chapterId);

    //通过课程id获取课程小结
    List<EduChapterDTO> getChapterVideoListByCourseId(String courseId);
}
