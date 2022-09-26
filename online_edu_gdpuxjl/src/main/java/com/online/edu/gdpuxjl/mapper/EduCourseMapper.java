package com.online.edu.gdpuxjl.mapper;

import com.online.edu.common.VO.CourseInfoVO;
import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {

    //根据课程id查询课程详情
    CourseWebVO selectInfoWebById(String courseId);


    //根据课程id查询课程详情
    CourseInfoVO getCourseInfoById(String courseId);

}
