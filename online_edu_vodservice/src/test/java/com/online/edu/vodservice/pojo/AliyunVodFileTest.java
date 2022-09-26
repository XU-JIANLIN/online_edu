package com.online.edu.vodservice.pojo;


import com.online.edu.vodservice.utils.ConstantPropertiesUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@SpringBootTest
public class AliyunVodFileTest {

    @Autowired
    AliyunVodFile aliyunVodFile;


    @Test
    public void TestAliyunVod(){


        System.out.println(ConstantPropertiesUtil.ACCESS_KEY_ID);
    }

}