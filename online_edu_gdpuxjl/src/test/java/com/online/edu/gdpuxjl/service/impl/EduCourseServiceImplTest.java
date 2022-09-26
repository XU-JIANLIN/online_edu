package com.online.edu.gdpuxjl.service.impl;

import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.gdpuxjl.service.EduCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;


@SpringBootTest
@RunWith(SpringRunner.class) // 在测试里面  需要加@Runwith注解  才能实现依赖注入！
public class EduCourseServiceImplTest {

    @Autowired
    private EduCourseService eduCourseService;




    @Test
    public void isFreeByCourseidTest(){
        String s = "7";
        String s1 = "1228580023630077954";
        boolean b = eduCourseService.isFreeByCourseid(s);
        boolean b1 = eduCourseService.isFreeByCourseid(s1);

        System.out.println("b = "+b);
        System.out.println("b1 = "+b1);
    }



}