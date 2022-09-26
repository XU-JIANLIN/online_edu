package com.online.edu.ucenterservice.service;

import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.ucenterservice.pojo.MemberCourse;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 会员课程表 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-03-29
 */
public interface MemberCourseService extends IService<MemberCourse> {

    public MemberCourse findMemberCoursebyMemberidandCourseid(String MemberId,String CourseId);

    List<String> getMemberCourse(String memberId);
}
