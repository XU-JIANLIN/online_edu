package com.online.edu.gdpuxjl.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.CourseInfoVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.CourseQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.online.edu.gdpuxjl.pojo.EduCourseDescription;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.service.EduCourseDescriptionService;
import com.online.edu.gdpuxjl.service.EduCourseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/online/course")
public class EduCourseController {


    @Autowired
    private EduCourseService eduCourseService ;

    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService ;


    //最终发布课程的方法，修改课程状态
    @ApiOperation("根据课程id修改课程状态")
    @GetMapping("publishCourse/{courseId}")
    public  ResultVO publishCourse(@PathVariable String courseId) {
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(courseId);
        eduCourse.setStatus("Normal");
        boolean result = eduCourseService.updateById(eduCourse);
        if(result) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }
    //根据课程id查询课程详细信息
    @ApiOperation("根据课程id查询课程详细信息")
    @GetMapping("getAllCourseInfo/{courseId}")
    public ResultVO getAllCourseInfo(@PathVariable String courseId) {
        log.info("根据课程id查询课程详细信息");
        CourseInfoVO courseInfoDto = eduCourseService.getCourseInfoAll(courseId);
        return ResultVOUtil.success("courseInfo",courseInfoDto);
    }


    //修改课程的方法
    @PostMapping("{id}")
    public ResultVO updateCourseInfo(@PathVariable String id,
                              @RequestBody CourseInfoDTO courseInfoDTO) {
        Boolean flag = eduCourseService.updateCourse(courseInfoDTO);
        if(flag) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.success();
        }
    }

    /**
     * 根据课程id查询课程
     * @param id
     * @return
     */
    @ApiOperation("根据课程id查询课程信息")
    @GetMapping("{id}")
    public ResultVO getCourseById(@ApiParam(name = "id", value = "课程id", required = true)
                                   @PathVariable String  id){
        log.info("【查询课程信息】 查询课程id为"+ id +"的信息");
        CourseInfoDTO courseInfoDTO = eduCourseService.findCourseById(id);

        return ResultVOUtil.success(courseInfoDTO);
    }
    /**
     * 根据课程id查询课程,提供给支付模块的接口
     * @param courseid
     * @return
     */
    @ApiOperation("根据课程id查询课程信息")
    @GetMapping("getCourseInfo/{courseid}")
    public CourseInfoDTO getCourseInfoById(@ApiParam(name = "courseid", value = "课程id", required = true)
                                  @PathVariable String  courseid){
        log.info("【查询课程信息】 查询课程id为"+ courseid +"的信息");
        CourseInfoDTO courseInfoDTO = eduCourseService.findCourseById(courseid);

        return courseInfoDTO;
    }


    /**
     * 3.保存课程信息
     * @param courseInfoDTO
     * @return
     */
    @ApiOperation("保存课程信息")
    @PostMapping
    public ResultVO saveCourse(@ApiParam(name = "CourseInfoDTO", value = "课程信息", required = false)
                               @RequestBody( required = false) CourseInfoDTO courseInfoDTO ) {

        String courseId = eduCourseService.saveCourseInfo(courseInfoDTO);
        HashMap<String, String> map = new HashMap<>();
        map.put("courseId", courseId);

        return ResultVOUtil.success(map);
    }

    /**
     * 2. 根据id删除课程
     * @param id
     * @return
     */
    @ApiOperation("根据id删除课程")
    @DeleteMapping("{id}")
    public ResultVO deleteCourseId(@PathVariable String id) {

        log.info("【删除课程】 删除id为："+id+"的课程");
        if( eduCourseService.removeCourseId(id) ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error( ResultEnum.ERROR);

        }
    }

    /**  1 .根据不同的条件进行查新，分页显示 。*/
    @ApiOperation(value = "分页讲师列表")
    @PostMapping("{page}/{limit}")
    public ResultVO pageList(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "CourseQuery", value = "查询对象", required = false)
            @RequestBody( required = false) CourseQuery CourseQuery){

                log.info("分页获取课程列表信息");
                //封装page分页对象
                Page<EduCourse> pageParam = new Page<>(page, limit);

                IPage<EduCourse> eduCrouseIPage = eduCourseService.pageQuery(pageParam, CourseQuery);
                HashMap<Object, Object> map = new HashMap<>();
                map.put("total", eduCrouseIPage.getTotal());
                map.put("items", eduCrouseIPage.getRecords());
                return  ResultVOUtil.success(map);
    }
}

