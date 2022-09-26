//package com.online.edu.ucenterservice.controller.webFront;
//
//import com.online.edu.common.VO.MemberVO;
//import com.online.edu.common.VO.ResultVO;
//import com.online.edu.common.enums.ResultEnum;
//import com.online.edu.common.utils.ResultVOUtil;
//import com.online.edu.ucenterservice.utils.JwtUtils;
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.ExpiredJwtException;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("ucenter/auth")
//@CrossOrigin
//@Slf4j
//public class AuthController {
//
//    @GetMapping("get-uesr-auth/{auth}")
//    public ResultVO Authentication(@PathVariable("auth") String auth){
//        //根据auth，查询用户是否登录
//        log.info("【用户认证】 认证用户是否登录成功 +" +auth);
//
//        //当用户JWT令牌未过期时，不会抛异常，正常返回用户信息
//        try{
//            //解析用户auth，取出accesstoken
//            Claims claims = JwtUtils.checkJWT(auth);
//            String accesstoken = (String)claims.get("accesstoken");
//
//            //根据accesstoken查询用户是否已经登录
//
//
//            return ResultVOUtil.success("loginInfo",);
//
//        }catch (ExpiredJwtException e){
//            //捕获到异常时，证明用户身份过过期，返回过期提示
//            log.info("【用户登录】 用户的token已过期，请重新登录 ");
//            return ResultVOUtil.error(ResultEnum.JWT_TIME_OVER);
//
//
//        }
//
//    }
//
//
//}
