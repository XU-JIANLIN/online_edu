package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.service.EduTeacherService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class EduTeacherServiceImplTest {

    @Autowired
     private EduTeacherService eduTeacherService;
    @Test
    public void pageQuery() {
        Page<EduTeacher> pageParam = new Page<>(1, 2);
        TeacherQuery teacherQuery = new TeacherQuery();
        teacherQuery.setName("周");

        IPage<EduTeacher> eduTeacherIPage = eduTeacherService.pageQuery(pageParam, teacherQuery);

        System.out.println(eduTeacherIPage);


    }

    @Test
    public void updateTeacher() {



        String id = "3";
        EduTeacher eduTeacher = new EduTeacher();

        eduTeacher.setName("钟汉良111");
        eduTeacher.setAvatar("string");
        eduTeacher.setCareer("string");
        eduTeacher.setIntro("string");
        eduTeacher.setLevel(1);
        eduTeacher.setSort(1);

        boolean save = eduTeacherService.save(eduTeacher);

        System.out.println("+++++++++++++++++" );
        System.out.println("保存是否成功" +save +"此时的id为：" + eduTeacher.getId());




    }
}
