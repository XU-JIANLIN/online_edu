package com.online.edu.gdpuxjl.controller.webFront;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.service.EduCourseService;
import com.online.edu.gdpuxjl.service.EduTeacherService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@CrossOrigin
@RestController
@Slf4j
@RequestMapping("online/frontteachers")
public class TeacherWebController {

    @Autowired
    EduTeacherService eduTeacherService;

    @Autowired
    EduCourseService eduCourseService;

    @ApiOperation("查询权重较高的老师")
    @GetMapping()
    public ResultVO getGoodTeacher() {

        //需要查询多少位老师
        Integer num = 4;
        List<EduTeacher> list = eduTeacherService.getTeacherBySort(num);
        return ResultVOUtil.success(list);
    }


    @ApiOperation("根据讲师id查询讲师详情")
    @GetMapping("{teacherId}")
    public ResultVO getTeacherDetails(@PathVariable String teacherId){

        log.info("【前台操作】查询Id为"+teacherId+"的讲师详情");
        //得到讲师信息
        EduTeacher teacher = eduTeacherService.getById(teacherId);

        //得到讲师所主讲的课程
        List<EduCourse> courseList = eduCourseService.selectByTeacherId(teacherId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("teacher",teacher);
        map.put("courseList",courseList);

        return ResultVOUtil.success(map);
    }


    @ApiOperation("前台分页查询讲师列表")
    @GetMapping("{page}/{limit}")
    public ResultVO getPageListTeachers(@PathVariable Long page, @PathVariable Long limit){

        Page<EduTeacher> pageParam = new Page<EduTeacher>(page, limit);

        log.info("【前台操作】查询讲师列表，第"+page+"页，每页"+limit+"条记录");
        Map<String, Object> map = eduTeacherService.pageQueryWeb(pageParam);

        return ResultVOUtil.success(map);
    }
}
