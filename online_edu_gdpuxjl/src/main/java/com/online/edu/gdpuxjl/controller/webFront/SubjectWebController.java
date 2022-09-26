package com.online.edu.gdpuxjl.controller.webFront;

import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.VO.SubjectParentVO;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.service.EduSubjectService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@CrossOrigin
@RestController
@RequestMapping("online/frontsubject")
@Slf4j
public class SubjectWebController {


    @Autowired
    EduSubjectService eduSubjectService;

    /**
     * 1.获取课程分类列表
     * @return
     */
    @ApiOperation("获取课程分类列表")
    @GetMapping
    public ResultVO getAllSubject() {

        List<SubjectParentVO> subjectList = eduSubjectService.getSubjectList();

        return ResultVOUtil.success(subjectList);

    }

}
