package com.online.edu.gdpuxjl.service.impl;


import com.online.edu.common.VO.SubjectParentVO;
import com.online.edu.gdpuxjl.service.EduSubjectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class EduSubjectServiceImplTest {

    @Autowired
    EduSubjectService eduSubjectService;

    @Test
    public void getSubjectList() {
        List<SubjectParentVO> subjectList = eduSubjectService.getSubjectList();
        System.out.println(subjectList);

    }

}