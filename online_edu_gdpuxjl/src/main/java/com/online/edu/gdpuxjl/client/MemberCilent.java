package com.online.edu.gdpuxjl.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@Component
@FeignClient("edu-ucenterservice")
public interface MemberCilent {


    //根据 用户凭证，获取用户id
    @GetMapping("/ucenter/member/getMemberId/{authorization}")
    public String getMemberID(
            @PathVariable("authorization") String authorization);


}
