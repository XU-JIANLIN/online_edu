package com.online.edu.gdpuxjl;


import com.online.edu.gdpuxjl.client.MemberCilent;
import com.online.edu.gdpuxjl.client.MemberCourseCilent;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class) // 在测试里面  需要加@Runwith注解  才能实现依赖注入！
public class OnlineEduGdpuxjlApplicationTests {


    @Autowired
    MemberCourseCilent memberCourseCilent;

    @Autowired
    MemberCilent memberCilent;

    final String auth = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnZHB1eGpsIiwibmlja25hbWUiOiLpqazmnY_lprnlprkiLCJhdmF0YXIiOiJodHRwczovL2dkcHV4amwtZWR1Lm9zcy1jbi1zaGVuemhlbi5hbGl5dW5jcy5jb20vZGVmYXVsdC5wbmciLCJtb2JpbGUiOiIxNTM2MjEyNDE3MyIsImFjY2Vzc3Rva2VuIjoiOWUxODNkYTQ1ZTI4NDFmYjlkODkyOGYyZjEyOTIxNmMiLCJpYXQiOjE1ODU0OTc3MzcsImV4cCI6MTU4NTQ5OTUzN30.t-3gfaUY0ukW1SF0bgoMI65Q6DThrGs8KRlTdBEOBuU";
    @Test
    public void contextLoads() {
//        System.out.println(memberCourseCilent.getMemberCourse("1", "2"));

//        boolean b = memberCourseCilent.saveMemberCourse("123", "23456");
//        System.out.println(b);


        String memberCourse = memberCilent.getMemberID(auth);
        System.out.println("memberCourse= "+memberCourse);
    }

}



