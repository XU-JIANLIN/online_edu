package com.online.edu.ucenterservice.utils;

import com.online.edu.common.VO.MemberVO;
import com.online.edu.ucenterservice.pojo.EduMember;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.util.StringUtils;

import java.util.Date;

/**
 * jwt工具类
 */
public class JwtUtils {


    public static final String SUBJECT = "gdpuxjl";

    //秘钥
    public static final String APPSECRET = "xjl6593632";

    public static final long EXPIRE = 1000 * 60 * 60 * 12 ;  //过期时间，毫秒，12小时


    /**
     * 生成jwt token
     * 单点登录 放回前端的对象
     * @param memberVO
     * @return
     */
    public static String geneJsonWebToken(MemberVO memberVO) {

        if (memberVO == null || StringUtils.isEmpty(memberVO.getNickname())
                || StringUtils.isEmpty(memberVO.getAvatar())
                || StringUtils.isEmpty(memberVO.getMobile())
                || StringUtils.isEmpty(memberVO.getAccesstoken())) {
            return null;
        }
        String token = Jwts.builder().setSubject(SUBJECT)
                .claim("nickname", memberVO.getNickname())
                .claim("avatar", memberVO.getAvatar())
                .claim("mobile", memberVO.getMobile())
                .claim("accesstoken",memberVO.getAccesstoken())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
                .signWith(SignatureAlgorithm.HS256, APPSECRET).compact();

        return token;
    }

    /**
     * 生成jwt token
     *
     * @param member
     * @return
     */
    public static String geneJsonWebToken(EduMember member) {

        if (member == null || StringUtils.isEmpty(member.getId())
                || StringUtils.isEmpty(member.getNickname())
                || StringUtils.isEmpty(member.getAvatar())) {
            return null;
        }
        String token = Jwts.builder().setSubject(SUBJECT)
                .claim("id", member.getId())
                .claim("nickname", member.getNickname())
                .claim("avatar", member.getAvatar())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
                .signWith(SignatureAlgorithm.HS256, APPSECRET).compact();

        return token;
    }


    /**
     * 校验jwt token
     *
     * @param token
     * @return
     */
    public static Claims checkJWT(String token) {
        Claims claims = Jwts.parser().setSigningKey(APPSECRET).parseClaimsJws(token).getBody();
        return claims;
    }

}