package com.online.edu.ucenterservice;


import com.online.edu.ucenterservice.pojo.EduMember;
import com.online.edu.ucenterservice.pojo.MemberCourse;
import com.online.edu.ucenterservice.pojo.WeXinFile;
import com.online.edu.ucenterservice.service.EduMemberService;
import com.online.edu.ucenterservice.service.MemberCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.DigestUtils;

import java.util.UUID;

@RunWith(SpringRunner.class) // 在测试里面  需要加@Runwith注解  才能实现依赖注入！
@SpringBootTest
public class UserCenterApplicationTests {
    @Autowired
    WeXinFile weXinFile;

    @Test
    public void contextLoads() {
        System.out.println(weXinFile.toString());
    }

    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Test
    public void loginTest(){


        String password = "123456";
        String digest = DigestUtils.md5DigestAsHex(password.getBytes());

        System.out.println("加密前密码"+password);
        System.out.println("加密后密码"+digest);

        String s = UUID.randomUUID().toString();
        stringRedisTemplate.opsForValue().set("diget", digest);
        System.out.println("redis中存储的密码:"+stringRedisTemplate.opsForValue().get("diget"));
    }

    @Autowired
    EduMemberService eduMemberService;

    @Test
    public void EduMemberServiceImplTest(){

//        EduMember exitMember = eduMemberService.isExitMember("15362124173", "123456");

//        System.out.println(exitMember.toString());

    }

    @Autowired
    MemberCourseService memberCourseService;
    @Test
    public void MemberCourseServiceImplTest(){

        MemberCourse memberCourse = new MemberCourse();

        memberCourse.setMemberid("123");
        memberCourse.setCourseid("123");

//        memberCourseService.save(memberCourse);
        MemberCourse one = memberCourseService.findMemberCoursebyMemberidandCourseid("1", "2");

        System.out.println(one);

    }
    @Test
    public void testmd5(){
        String a = "35d316b5360d399ed9306acdb76584c6";
        String b = "35d316b5360d399ed9306acdb76584c6";
        System.out.println(b.equals(a));

    }
}
