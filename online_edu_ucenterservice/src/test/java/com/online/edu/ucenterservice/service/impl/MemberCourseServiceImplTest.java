package com.online.edu.ucenterservice.service.impl;

import com.online.edu.ucenterservice.service.MemberCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class) // 在测试里面  需要加@Runwith注解  才能实现依赖注入！
@SpringBootTest
public class MemberCourseServiceImplTest {

    @Autowired
    private MemberCourseService service;

    @Test
    public void test(){

        String memberid = "1230881388586917890";
        service.getMemberCourse(memberid);
    }

}