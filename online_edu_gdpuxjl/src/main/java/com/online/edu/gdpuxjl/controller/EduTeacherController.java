package com.online.edu.gdpuxjl.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.service.EduTeacherService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-03
 */


@RestController
@RequestMapping("/online/teachers")
@CrossOrigin //跨域
@Slf4j
public class EduTeacherController {

    @Autowired
    private EduTeacherService eduTeacherService;


    /** 根据 ID 查找教师 */
    @ApiOperation(value = "查找所有讲师")
    @GetMapping()
    public ResultVO findTeacher() {
        log.info("【查询讲师】 查询所有讲师");
        List<EduTeacher> teacherList = eduTeacherService.list(null);
        return ResultVOUtil.success(teacherList);
    }






    /** 根据 ID 查找教师 */
    @ApiOperation(value = "查找讲师")
    @GetMapping("{id}")
    public ResultVO findTeacher(  @ApiParam( value = "讲师ID")
                                      @PathVariable String id) {


        log.info("【查询讲师】 查询ID为" + id + "的讲师");
        EduTeacher eduTeacher = eduTeacherService.getById(id);
        if (eduTeacher != null) {

            return ResultVOUtil.success(eduTeacher);
        }else {
            return ResultVOUtil.error(ResultEnum.TEACHER_NOT_EXIST);
        }

    }


    /** 根据 ID 修改教师信息 */
    @ApiOperation(value = "修改讲师信息")
    @PutMapping("{id}")
    public ResultVO updateTeacher(
                        @ApiParam( value = "讲师ID")
                        @PathVariable String id,
                        @ApiParam( value = "所要修改的信息")
                        @RequestBody EduTeacher eduTeacher) {


        log.info("【修改讲师信息】 修改id为" + id + "的讲师");
        int i = eduTeacherService.updateTeacher(id, eduTeacher);

        if (i == 1) {
            return  ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(ResultEnum.TEACHER_NOT_EXIST);
        }



    }


    @ApiOperation(value = "添加讲师")
    @PostMapping()
    public ResultVO addTeacher (
                        @ApiParam(name = "teacherQuery", value = "查询对象")
                        @RequestBody EduTeacher eduTeacher) {


        log.info("【保存讲师】 保存名字为"+eduTeacher.getName()+"的讲师");
        boolean save = eduTeacherService.save(eduTeacher);
        if (save) {
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(1,"失败");
        }

    }

    /**  根据不同的条件查询讲师，分页显示 。*/
    @ApiOperation(value = "分页讲师列表")
    @PostMapping("{page}/{limit}")
    public ResultVO pageList(
                HttpServletResponse response,
                @ApiParam(name = "page", value = "当前页码", required = true)
                @PathVariable Long page,
                @ApiParam(name = "limit", value = "每页记录数", required = true)
                @PathVariable Long limit,
                @ApiParam(name = "teacherQuery", value = "查询对象", required = false)
                @RequestBody( required = false) TeacherQuery queryTeacher){

        log.info("获取讲师信息");
        //封装page分页对象
        Page<EduTeacher> pageParam = new Page<>(page, limit);



        IPage<EduTeacher> eduTeacherIPage = eduTeacherService.pageQuery(pageParam, queryTeacher);

        HashMap<Object, Object> map = new HashMap<>();
        map.put("total", eduTeacherIPage.getTotal());
        map.put("items", eduTeacherIPage.getRecords());
        return  ResultVOUtil.success(map);
    }

    /** 根据 ID 删除教师 */
    @ApiOperation(value = "删除讲师")
    @DeleteMapping("{id}")
    public ResultVO removeById(@PathVariable String id){
        log.info("【删除讲师】 删除id为："+id+"的讲师");
        if( eduTeacherService.removeById(id) ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error( ResultEnum.ERROR);

        }
    }
}

