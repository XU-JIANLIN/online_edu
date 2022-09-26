package com.online.edu.ucenterservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.ucenterservice.pojo.MemberCourse;
import com.online.edu.ucenterservice.mapper.MemberCourseMapper;
import com.online.edu.ucenterservice.service.MemberCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 会员课程表 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-03-29
 */
@Service
public class MemberCourseServiceImpl extends ServiceImpl<MemberCourseMapper, MemberCourse> implements MemberCourseService {

    @Override
    public MemberCourse findMemberCoursebyMemberidandCourseid(String MemberId, String CourseId) {


        QueryWrapper<MemberCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("memberid",MemberId);
        wrapper.eq("courseid",CourseId);

        return baseMapper.selectOne(wrapper);
    }


    @Override
    public List<String> getMemberCourse(String memberId) {

        //根据id取出用户的课程id
        QueryWrapper<MemberCourse> wrapper = new QueryWrapper();
        wrapper.select("courseid");
        wrapper.eq("memberid",memberId);
        List<MemberCourse> memberCourses = baseMapper.selectList(wrapper);


        ArrayList<String> courseIdList = new ArrayList<>();
        for (MemberCourse memberCourse: memberCourses){
            courseIdList.add(memberCourse.getCourseid());
        }


        return courseIdList;
    }
}
