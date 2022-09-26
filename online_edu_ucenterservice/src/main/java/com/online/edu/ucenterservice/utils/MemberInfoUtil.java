package com.online.edu.ucenterservice.utils;

import com.alibaba.fastjson.JSON;
import com.online.edu.ucenterservice.pojo.EduMember;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PathVariable;

public class MemberInfoUtil {

    @Autowired
    private static StringRedisTemplate stringRedisTemplate;

    public static String getMemberId( String authorization){
        //获取登录用户的id
        Claims claims = JwtUtils.checkJWT(authorization);
        String accesstoken = (String)claims.get("accesstoken");

        String userInfo = stringRedisTemplate.opsForValue().get(accesstoken);

//        EduMember eduMember = (EduMember)JSON.toJSON(userInfo);

        EduMember eduMember = JSON.parseObject(userInfo, EduMember.class); //反序列化

        return eduMember.getId();

    }
}
