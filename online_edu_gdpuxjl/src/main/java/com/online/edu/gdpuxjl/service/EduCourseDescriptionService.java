package com.online.edu.gdpuxjl.service;

import com.online.edu.gdpuxjl.pojo.EduCourseDescription;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程简介 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
public interface EduCourseDescriptionService extends IService<EduCourseDescription> {

    //根据课程id删除课程描述
    void deleteDescriptionByCourseId(String id);
}
