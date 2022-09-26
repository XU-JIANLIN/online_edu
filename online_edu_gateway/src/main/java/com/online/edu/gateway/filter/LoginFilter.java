package com.online.edu.gateway.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.exception.EduException;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.ucenterservice.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.implementation.bytecode.Throw;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;


@Component
@Slf4j
public class LoginFilter extends ZuulFilter {


    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    //定义过滤器的类型
    @Override
    public String filterType() {
        return "pre"; //pre类型过滤器
    }

    //过滤器执行顺序，返回值越小，越先执行
    @Override
    public int filterOrder() {
        return 0;
    }

    //决定是否执行下面的run方法
    //如果返回false，表示过滤器放行，否则拦截，执行run
    @Override
    public boolean shouldFilter() {
        // 判断：访问的路径包含/vidservice/vod/getPlayAuth 进行校验
        //1 获取请求路径的 uri

        RequestContext currentContext = RequestContext.getCurrentContext();
        HttpServletRequest request = currentContext.getRequest();
        String requestURI = request.getRequestURI();

//        System.out.println("uri"+requestURI);

        String palyUrl = "/vidservice/vod/getPlayAuth";
        String courseInfo = "/online/frontcourse/getCourseInfo";
        //2 根据获取请求路径判断，路径中是否包含 /vidservice/vod/getPlayAuth

        if (!StringUtils.isEmpty(courseInfo) && requestURI.contains(courseInfo)){
            //3 如果包含，进行验证操作，return true
            return true;  //执行run方法，进行拦截
        }


        return false;
    }

//    过滤器的执行逻辑
    @Override
    public ResultVO run() throws ZuulException {
        System.out.println("run方法执行了");
        RequestContext currentContext = RequestContext.getCurrentContext();
        HttpServletRequest request = currentContext.getRequest();
        String authorization = request.getHeader("Authorization");

        System.out.println("authorization==" +authorization);
        //登录校验逻辑
        Claims claims = JwtUtils.checkJWT(authorization);
        String accesstoken = (String)claims.get("accesstoken");

        String userInfo = stringRedisTemplate.opsForValue().get(accesstoken);
        if (StringUtils.isEmpty(userInfo)){

            log.info("用户未登录");
//            ResultVOUtil.error(10012,"未登录");
//            //为false时，不会继续向后执行
            currentContext.setSendZuulResponse(false);

//            //设置不能访问状态码
//            currentContext.setResponseStatusCode(HttpStatus.SC_UNAUTHORIZED);
            currentContext.setResponseBody("{\"status\":401,\"msg\":\"用户未登录 !\"}");
            currentContext.getResponse().setContentType("text/html;charset=UTF-8");
        }else{
            log.info("用户已登录");
        }

        return null;
    }
}
