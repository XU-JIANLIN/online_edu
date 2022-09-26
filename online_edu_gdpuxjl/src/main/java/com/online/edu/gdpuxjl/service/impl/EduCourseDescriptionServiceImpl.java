package com.online.edu.gdpuxjl.service.impl;

import com.online.edu.gdpuxjl.pojo.EduCourseDescription;
import com.online.edu.gdpuxjl.mapper.EduCourseDescriptionMapper;
import com.online.edu.gdpuxjl.service.EduCourseDescriptionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程简介 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@Service
public class EduCourseDescriptionServiceImpl extends ServiceImpl<EduCourseDescriptionMapper, EduCourseDescription> implements EduCourseDescriptionService {

    //根据课程id删除课程描述
    @Override
    public void deleteDescriptionByCourseId(String id) {
            baseMapper.deleteById(id);
    }
}
