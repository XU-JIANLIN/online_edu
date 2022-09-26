package com.online.edu.ucenterservice.controller;


import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.ucenterservice.pojo.MemberCourse;
import com.online.edu.ucenterservice.pojo.StatisticsLunbotu;
import com.online.edu.ucenterservice.service.MemberCourseService;
import com.online.edu.ucenterservice.utils.MemberInfoUtil;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 会员课程表 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-03-29
 */
@RestController
@RequestMapping("/ucenter/membercourse")
@CrossOrigin
@Slf4j
public class MemberCourseController {

    @Autowired
    private MemberCourseService courseService;


    //根据用户id，获取用户拥有课程id
    @GetMapping("courseIdList/{memberid}")
    public List<String> getMyCourse(@PathVariable String memberid){

        log.info("根据用户id，获取用户拥有课程id"+memberid);
        List<String> list = courseService.getMemberCourse(memberid);

       return list;

    }


    /**
     * 提供服务接口，保存会员的课程观看记录
     * @param
     * @return
     */
    @PostMapping("save")
    public boolean saveMemberCourse(
            @RequestParam("memberid") String memberid,
            @RequestParam("courseid") String courseid){

        MemberCourse memberCourse = new MemberCourse();
        memberCourse.setMemberid(memberid);
        memberCourse.setCourseid(courseid);
        return courseService.save(memberCourse);
    }


    /**
     * 根据会员id和课程id查询用户是否购买过该课程
     * @return
     */
    @GetMapping("get/{memberid}/{courseid}")
    public boolean getMemberCourse(@PathVariable String memberid,
                                        @PathVariable String courseid){

        MemberCourse course = courseService.findMemberCoursebyMemberidandCourseid(memberid, courseid);
        if (course != null){
            return true;

        }else{
            return false;
        }

    }


}

