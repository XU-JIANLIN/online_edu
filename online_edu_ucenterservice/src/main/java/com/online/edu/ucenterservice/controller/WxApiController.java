package com.online.edu.ucenterservice.controller;

import com.google.gson.Gson;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.ucenterservice.pojo.EduMember;
import com.online.edu.ucenterservice.pojo.WeXinFile;
import com.online.edu.ucenterservice.service.EduMemberService;
import com.online.edu.ucenterservice.utils.ConstantPropertiesUtil;
import com.online.edu.ucenterservice.utils.HttpClientUtils;
import com.online.edu.ucenterservice.utils.JwtUtils;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;

/**
 * @描述： 微信登录测试类
 * @作者： 许JIAN林
 */
@Controller
@CrossOrigin
@Slf4j
@RequestMapping("/api/ucenter/wx")
public class WxApiController {

    @Autowired
    EduMemberService eduMemberService;

    @ApiOperation("微信登录回调接口")
    @GetMapping("callback")
    public String callback(String code, String state, HttpSession session) {

        log.info("【微信登录】用户扫码确认登录");
        //得到授权临时票据code
        System.out.println(code);
        System.out.println(state);

        //从redis中将state获取出来，和当前传入的state作比较
        //如果一致则放行，如果不一致则抛出异常：非法访问

        //向认证服务器发送请求换取access_token
        String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=%s" +
                "&secret=%s" +
                "&code=%s" +
                "&grant_type=authorization_code";




        String accessTokenUrl = String.format(baseAccessTokenUrl,
                ConstantPropertiesUtil.WX_OPEN_APP_ID,
                ConstantPropertiesUtil.WX_OPEN_APP_SECRET,
                code);

        String result = null;
        try {
            //如果不用此工具类，需要进行多次跳转
            //模拟一个get请求
            result = HttpClientUtils.get(accessTokenUrl);
            System.out.println("accessToken=============" + result);
        } catch (Exception e) {
            throw new EduException(ResultEnum.GET_ACCESS_TOKEN_FALSE);
        }

        //解析json字符串
        Gson gson = new Gson();
        //将json字符串 转化为 map格式
        HashMap map = gson.fromJson(result, HashMap.class);
        String accessToken = (String)map.get("access_token");
        String openid = (String)map.get("openid");



        //查询数据库当前用用户是否曾经使用过微信登录
        EduMember member = eduMemberService.getByOpenid(openid);
        if(member == null){
            System.out.println("新用户注册");
            log.info("【微信登录】 新用户注册");

            //访问微信的资源服务器，获取用户信息
            String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                    "?access_token=%s" +
                    "&openid=%s";
            String userInfoUrl = String.format(baseUserInfoUrl, accessToken, openid);
            String resultUserInfo = null;
            try {
                //如果不用此工具类，需要进行多次跳转
                //模拟一个get请求
                resultUserInfo = HttpClientUtils.get(userInfoUrl);
                System.out.println("resultUserInfo==========" + resultUserInfo);
                log.info("resultUserInfo==========" + resultUserInfo);
            } catch (Exception e) {
                throw new EduException(ResultEnum.GET_USERINFO_FALSE);
            }

            //解析json
            //将json字符串 转化为 map格式
            HashMap<String, Object> mapUserInfo = gson.fromJson(resultUserInfo, HashMap.class);
            String nickname = (String)mapUserInfo.get("nickname");
            String headimgurl = (String)mapUserInfo.get("headimgurl");

            //向数据库中插入一条记录
            member = new EduMember();
            member.setNickname(nickname);
            member.setOpenid(openid);
            member.setAvatar(headimgurl);
            eduMemberService.save(member);
        }

//        log.info("【微信登录】 老用户登录");
        //TODO 登录

        // 生成jwt
        String token = JwtUtils.geneJsonWebToken(member);

        //存入cookie
        //CookieUtils.setCookie(request, response, "guli_jwt_token", token);

        //因为端口号不同存在跨域问题，cookie不能跨域，所以这里使用url重写
        return "redirect:http://localhost:3000?token=" + token;
    }


    @ApiOperation("微信登录请求接口")
    @GetMapping("login")
    public String getQrConnect(HttpSession httpSession){

        log.info("【微信登录】用户请求登录");
        // 微信开放平台授权baseUrl
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";

        // 回调地址
        String redirectUrl = ConstantPropertiesUtil.WX_OPEN_REDIRECT_URL; //获取业务服务器重定向地址
        try {
            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8"); //url编码
        } catch (Exception e) {
            throw new EduException(ResultEnum.ENCODE_URL_FALSE);
        }

        // 防止csrf攻击（跨站请求伪造攻击）
        //String state = UUID.randomUUID().toString().replaceAll("-", "");//一般情况下会使用一个随机数
        String state = "gdpuxjl";//为了让大家能够使用我搭建的外网的微信回调跳转服务器，这里填写你在ngrok的前置域名
        System.out.println("state = " + state);

        // 采用redis等进行缓存state 使用sessionId为key 30分钟后过期，可配置
        //键："wechar-open-state-" + httpServletRequest.getSession().getId()
        //值：satte
        //过期时间：30分钟

        //生成qrcodeUrl
        String qrcodeUrl = String.format(
                baseUrl,
                ConstantPropertiesUtil.WX_OPEN_APP_ID,
                redirectUrl,
                state);

        return "redirect:" + qrcodeUrl;
    }
}
