package com.online.edu.gdpuxjl.controller;


import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.VO.SubjectParentVO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduSubject;
import com.online.edu.gdpuxjl.service.EduSubjectService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-08
 */
@RestController
@RequestMapping("/online/subject")
@CrossOrigin
@Slf4j
public class EduSubjectController {

    @Autowired
    private EduSubjectService eduSubjectService;


    /**
     * 添加二级标题
     * @param eduSubject
     * @return
     */
    @ApiOperation("添加二级标题")
    @PostMapping("addTwoLevel")
    public ResultVO addTwoLevel(@ApiParam("二级标题对象")
                                @RequestBody EduSubject eduSubject) {
        log.info("【添加分类】 用户添加 “" +eduSubject.getTitle()+ "”二级分类" );
        boolean flag = eduSubjectService.saveSecondLevel(eduSubject);
        if(flag) {
            log.info("【添加分类】 添加二级分类成功" );
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    /**
     * 4. 添加一级标题
     * @param eduSubject
     * @return
     */
    @ApiOperation("添加一级标题")
    @PostMapping("addOneLevel")
    public ResultVO addOneLevel(@ApiParam("一级标题对象")
                                    @RequestBody EduSubject eduSubject) {

        log.info("【添加分类】 用户添加 “" +eduSubject.getTitle()+ "”一级分类" );
        boolean flag = eduSubjectService.saveFirstLevel(eduSubject);

        if(flag) {
            log.info("【添加分类】 添加一级分类成功" );
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


    /**
     * 3. 根据 id 删除分类
     * @param id
     * @return
     */
    @ApiOperation("删除课程分类")
    @DeleteMapping("{id}")
    public ResultVO deleteSubjectId(@ApiParam("删除分类的ID")
                                        @PathVariable String id) {

        log.info("【删除分类】 用户删除 " +id+ "分类" );
        boolean flag = eduSubjectService.deleteSubjectById(id);
        if (flag) {
            log.info("【删除分类】 删除成功" );
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


    /**
     * 2.获取课程分类列表
     * @return
     */
    @ApiOperation("获取课程分类列表")
    @GetMapping
    public ResultVO getAllSubject() {

        List<SubjectParentVO> subjectList = eduSubjectService.getSubjectList();

        return ResultVOUtil.success(subjectList);

    }




    /**
     *  1. poi操作，导入Excel，生成课程类目分类
     * @param file
     * @return
     */
    @ApiOperation("poi操作，导入Excel，生成课程类目分类")
    @PostMapping("import")
    public ResultVO importSubject(
                    @ApiParam(name = "file", value = "Excel文件", required = true)
                    @RequestParam("file") MultipartFile file){

        List<String> list = eduSubjectService.batchImport(file);
            return ResultVOUtil.success(list);
    }




}

