package com.online.edu.gdpuxjl.controller.webFront;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.EduChapterDTO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.online.edu.gdpuxjl.service.EduChapterService;
import com.online.edu.gdpuxjl.service.EduCourseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@CrossOrigin
@RestController
@RequestMapping("online/frontcourse")
@Slf4j
public class CourseWebController {

    @Autowired
    EduCourseService eduCourseService;

    @Autowired
    EduChapterService eduChapterService;

    @GetMapping("Membercourse")
    public ResultVO getMyCourse(HttpServletRequest request){
        //取出用户凭证，获取用户id;
        String authorization = request.getHeader("Authorization");

        log.info("auth"+authorization);
        List<EduCourse> list = eduCourseService.getMemberCourseByAuth(authorization);

        Map<String, Object> map = new HashMap();
        map.put("items",list);
        if (list == null){
            map.put("total",0);
        }else{
            map.put("total",list.size());
        }
        System.out.println("查到的数据为");

//        System.out.println("查出数据库");
        return ResultVOUtil.success(map);
//        return ResultVOUtil.success();
    }




    @ApiOperation(value = "查询最新的8门课程")
    @GetMapping()
    public ResultVO getNewCourse(){

        List<EduCourse> list = eduCourseService.selectNewCourse();
        return ResultVOUtil.success(list);
    }




    @ApiOperation(value = "根据ID查询课程详情")
    @GetMapping(value = "getCourseInfo/{courseId}")
    public ResultVO getById(
            @ApiParam(name = "courseId", value = "课程ID", required = true)
            @PathVariable String courseId, HttpServletRequest request){


//        获取用户id凭证
        String authorization = request.getHeader("Authorization");

        int isbuy = 1; //若购买，为1, 未购买为0；

        //判断课程是否免费
        boolean isfree = eduCourseService.isFreeByCourseid(courseId);

        if (isfree){
            //免费：直接显示
            //写进会员课程记录
            eduCourseService.saveMemberCourse(authorization,courseId);

        }else {
            //收费： 判断是否已经购买该课程
            boolean bool = eduCourseService.isMemberHaveCourse(authorization, courseId);
            if (!bool){
                //未购买
                isbuy = 0;
            }
            //已经购买
        }

        //查询课程信息和讲师信息
        CourseWebVO courseWebVO = eduCourseService.selectInfoWebById(courseId);

        //查询当前课程的章节信息
        List<EduChapterDTO> chapterVOList = eduChapterService.getChapterVideoListByCourseId(courseId);

        HashMap<String, Object> map = new HashMap<>();

        map.put("course",courseWebVO);
        map.put("chapterVOList",chapterVOList);
        map.put("isbuy",isbuy);
        return ResultVOUtil.success(map);

    }

    @ApiOperation("前台- 根据二级分类列表分页获取课程列表")
    @GetMapping("{twosubjectid}/{page}/{limit}")
    public ResultVO getCourseWebList(@PathVariable String twosubjectid,
                                     @PathVariable Long page,
                                     @PathVariable Long limit){
        Page<EduCourse> coursePage = new Page<>(page, limit);
        Map<String, Object> map = eduCourseService.pageListWeb(twosubjectid,coursePage);

        return ResultVOUtil.success(map);

    }

}
