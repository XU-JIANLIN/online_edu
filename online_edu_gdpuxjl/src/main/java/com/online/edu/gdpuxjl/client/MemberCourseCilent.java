package com.online.edu.gdpuxjl.client;

import com.online.edu.common.VO.ResultVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@Component
@FeignClient("edu-ucenterservice")
public interface MemberCourseCilent {



    //定义查找会员所拥有的课程id
    @GetMapping("/ucenter/membercourse/courseIdList/{memberid}")
    public List getMemberCourseIdList(@PathVariable("memberid") String memberid);



    //定义添加会员课程观看记录的方法
    @PostMapping(value = "/ucenter/membercourse/save")
    public boolean saveMemberCourse(@RequestParam("memberid")String memberid,
                                @RequestParam("courseid")String courseid);


    //定义查找会员是否购买课程记录的方法
    @GetMapping("/ucenter/membercourse/get/{memberid}/{courseid}")
    public boolean getMemberCourse(
            @PathVariable("memberid") String memberid,
            @PathVariable("courseid") String courseid);


}
