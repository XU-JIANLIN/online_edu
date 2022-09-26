package com.online.edu.ucenterservice.controller;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.MemberVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.MemberQuery;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.ucenterservice.pojo.EduMember;
import com.online.edu.ucenterservice.service.EduMemberService;
import com.online.edu.ucenterservice.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Member;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-30
 */
@RestController
@RequestMapping("/ucenter/member")
@CrossOrigin
@Slf4j
public class EduMemberController {

    @Autowired
    private EduMemberService eduMemberService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    @ResponseBody
    @ApiOperation("添加新用户")
    @PostMapping("addmember")
    public ResultVO addmember(@RequestBody(required = false) EduMember eduMember){


        String type = eduMember.getType() == 1 ? "管理员" : "普通会员";
        log.info("【添加用户】 添加用户类型为 ：" + type );
        log.info("【添加用户】 添加用户信息为 ：" + eduMember.toString() );
        if ( eduMemberService.addMember(eduMember)){
            return ResultVOUtil.success();

        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


    /** 根据 ID 重置密码 */
    @ApiOperation(value = "重置密码")
    @GetMapping("{id}")
    public ResultVO resetMemberPass(@PathVariable String id){
        log.info("【重置密码】 重置id为："+id+"的用户密码");
        if( eduMemberService.resetMemberPass(id) ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error( ResultEnum.ERROR);
        }
    }
    /** 根据 ID 删除用户 */
    @ApiOperation(value = "删除用户")
    @DeleteMapping("{id}")
    public ResultVO removeById(@PathVariable String id){
        log.info("【删除用户】 删除id为："+id+"的用户");
        if( eduMemberService.removeById(id) ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error( ResultEnum.ERROR);
        }
    }


    /**  根据不同的条件查询讲师，分页显示 。*/
    @ApiOperation(value = "分页用户列表")
    @PostMapping("{page}/{limit}/{type}")
    public ResultVO pageList(
            HttpServletRequest request,
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "type", value = "用户类型", required = true)
            @PathVariable Long type,
            @ApiParam(name = "MemberQuery", value = "查询对象", required = false)
            @RequestBody( required = false) MemberQuery memberQuery){

        String authorization = request.getHeader("authorization");
        log.info("【获取用户分类信息】 管理员凭证 =" + authorization);
        String memberId = getMemberId(authorization);
        log.info("【获取用户分类信息】 管理员ID =" + memberId);
        log.info("获取用户分类信息");
        //封装page分页对象
        Page<EduMember> pageParam = new Page<>(page, limit);

        IPage<EduMember> eduMemberIPage = eduMemberService.pageQuery(memberId,pageParam,type,memberQuery);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("total", eduMemberIPage.getTotal());
        map.put("items", eduMemberIPage.getRecords());
        return  ResultVOUtil.success(map);
    }


    @PostMapping("updatepass")
    //axios post提交是以json,所以无法用（@RequestParam 获取值，目前只知道用Map接收）
    public ResultVO updatepass(@RequestBody(required = false) Map map, HttpServletRequest req) {

        log.info("【用户修改密码】");
//        System.out.println(mobile + password);
        String id = map.get("id").toString();
        String curpass = map.get("curpass").toString();
        String newpass = map.get("newpass").toString();

        System.out.println("id" + id);
        System.out.println("curpass" + curpass);
        System.out.println("newpass" + newpass);
        int flag = eduMemberService.updatePass(id,curpass,newpass);
        if (flag == 1){
            return ResultVOUtil.success();

        }else if (flag == 0){
            return ResultVOUtil.error(20002,"当前密码错误");
        }else{
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }
    @PostMapping("updateinfo")
    public ResultVO updateInfo(@RequestBody(required = false) MemberVO memberVO){
        log.info("【用户修改个人信息】" + memberVO.toString());
        //由于更新



        boolean bool = eduMemberService.updateInfo(memberVO);


        if (bool){
            return ResultVOUtil.success();

        } else {
            throw new EduException(ResultEnum.ERROR);
//            return ResultVOUtil.error(ResultEnum.ERROR);
        }

    }


    /**
     * 根据 用户凭证，获取用户id
     */
    @GetMapping("getMemberId/{authorization}")
    public String getMemberId(@PathVariable String authorization){
        log.info("获取登录用户的id");
        log.info("接受到的令牌"+authorization);
        //获取登录用户的id
        Claims claims = JwtUtils.checkJWT(authorization);
        log.info("令牌解析后："+claims);
        String accesstoken = (String)claims.get("accesstoken");

        String userInfo = stringRedisTemplate.opsForValue().get(accesstoken);

//        EduMember eduMember = (EduMember)JSON.toJSON(userInfo);

        EduMember eduMember = JSON.parseObject(userInfo, EduMember.class); //反序列化

        log.info("用户的id="+ eduMember.getId());
        return eduMember.getId();

    }

    @ResponseBody
    @ApiOperation("验证该手机号码是否已经注册")
    @GetMapping("checkmobile/{mobile}/{type}")
    public ResultVO checkMoile(@PathVariable String mobile, @PathVariable int type ){
        boolean flag = eduMemberService.isRegisterByMobile(mobile,type);

        if (flag){
            return ResultVOUtil.error(ResultEnum.MOBILE_EXIST);
        }
        return ResultVOUtil.success();
    }

    @ResponseBody
    @ApiOperation("普通用户进行注册")
    @PostMapping("register")
    public ResultVO register(@RequestBody(required = false) EduMember eduMember){

        System.out.println(eduMember.toString());

        eduMember.setAge(0);
        eduMember.setSex(0);
        eduMember.setSign("哈喽~");
        eduMember.setType(2); //只有普通会员才可以注册
        boolean save = eduMemberService.saveEdumember(eduMember);

        if (save){
            return ResultVOUtil.success();

        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }



    @ApiOperation("用户退出")
    @GetMapping("logout")
    public ResultVO Logout(HttpServletRequest request){
        log.info("【用户退出】");
        String authorization = request.getHeader("authorization");
        log.info("接受到的令牌=" +authorization);
        Claims claims = JwtUtils.checkJWT(authorization);
        log.info("令牌解析后："+claims);
        String accesstoken = (String)claims.get("accesstoken");
        log.info("accesstoken："+accesstoken);
        Boolean delete = stringRedisTemplate.delete(accesstoken);//根据key删除缓存

        if (delete){
            return ResultVOUtil.success();
        }
        return ResultVOUtil.error(ResultEnum.ERROR);

    }

    @ApiOperation("管理员进行登录")
    @PostMapping("admin/login")
    //axios post提交是以json,所以无法用（@RequestParam 获取值，目前只知道用Map接收）
    public ResultVO AdminLogin(@RequestBody(required = false) Map map){
        log.info("【用户登录】 管理员进行登录");

        int type = 1;
        String mobile = map.get("mobile").toString();
        String password = map.get("password").toString();
        String token = getLoginToken(mobile, password, type);
        return ResultVOUtil.success("token",token);

    }
    @ApiOperation("普通用户进行登录")
    @PostMapping("login")
    //axios post提交是以json,所以无法用（@RequestParam 获取值，目前只知道用Map接收）
    public ResultVO MemberLogin(@RequestBody(required = false) Map map) {
        // TODO 单点登录
        log.info("【用户登录】 普通用户进行登录");

        int type = 2;
        String mobile = map.get("mobile").toString();
        String password = map.get("password").toString();
        String token = getLoginToken(mobile, password, type);
        return ResultVOUtil.success("token",token);

    }


    /**
     * 抽离出登录方法
     * @param mobile
     * @param password
     * @param type
     * @return
     */
    private String getLoginToken(String mobile, String password, int type){
        EduMember member = eduMemberService.isExitMember(mobile, password,type);
        log.info("【用户登录】" );
        //根据查询的结果查询用户是否存在，若存在，登录成功 否则登录失败
        if (member == null) {
            //用户不存在
            log.info("【用户登录】用户不存在");
            throw new EduException(ResultEnum.USER_NO_EXIST);
        } else {
            //用户存在

            log.info("【用户登录】用户存在");
            //存到redis数据库
            //生成token令牌
            String nickname = member.getNickname();
            String avatar = member.getAvatar();
            String phone = member.getMobile();
            member.setPassword(""); //密码设为空
            String jsonString = JSON.toJSONString(member);
            //uuid作为redis存储的key
            String accesstoken = UUID.randomUUID().toString().replace("-", "");

            //过期时间 12小时
            stringRedisTemplate.opsForValue().set(accesstoken, jsonString,60 * 60 * 12, TimeUnit.SECONDS);

            MemberVO memberVO = new MemberVO();

            memberVO.setNickname(nickname);
            memberVO.setAvatar(avatar);
            memberVO.setMobile(phone);
            memberVO.setAccesstoken(accesstoken);

//            System.out.println(memberVO);
            String token = JwtUtils.geneJsonWebToken(memberVO);
            log.info("【用户登录】登录成功");
//            System.out.println("生成的token为：" +token);
            return token;

        }


    }






    @ResponseBody
    @PostMapping("info")
    public ResultVO getInfoByToken( @RequestParam String token){


        log.info("【用户登录】 用户查询个人信息 +" +token);

        //当用户JWT令牌未过期时，不会抛异常，正常返回用户信息
        try{
            Claims claims = JwtUtils.checkJWT(token);
//            String nickname = (String)claims.get("nickname");
//            String avatar = (String)claims.get("avatar");
//            String phone = (String )claims.get("phone");
            String accesstoken = (String)claims.get("accesstoken");
            MemberVO memberVO = new MemberVO();

            //从redis数据库中，取出用户信息
            String userInfo = stringRedisTemplate.opsForValue().get(accesstoken);


            EduMember eduMember = JSON.parseObject(userInfo, EduMember.class); //反序列化
            log.info("【用户登录】 用户信息为= " +eduMember.toString());

            //判断用户类型
            Integer type = eduMember.getType();
            if (type == 1){
                //管理员
                memberVO.setRoles("【管理员】");
            }else{
                //普通会员
                memberVO.setRoles("【普通会员】");
            }
            memberVO.setAvatar(eduMember.getAvatar());
            memberVO.setNickname(eduMember.getNickname());
            memberVO.setMobile(eduMember.getMobile());

            memberVO.setAge(eduMember.getAge());
            memberVO.setSex(eduMember.getSex());
            memberVO.setId(eduMember.getId());
            memberVO.setSign(eduMember.getSign());
            memberVO.setType(eduMember.getType());

            memberVO.setAccesstoken(accesstoken);

            return ResultVOUtil.success("loginInfo",memberVO);
        }catch (ExpiredJwtException e){
            //捕获到异常时，证明用户身份过过期，返回过期提示
            log.info("【用户登录】 用户的token已过期，请重新登录 ");
            return ResultVOUtil.error(ResultEnum.JWT_TIME_OVER);


        }
    }
}

