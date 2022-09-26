package com.online.edu.payservice.client;

import com.online.edu.common.dto.CourseInfoDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Component
@FeignClient("edu-gdpuxjl")
public interface CourseCilent {
    //根据 用户凭证，获取用户id
    @GetMapping("/online/course/getCourseInfo/{courseid}")
    public CourseInfoDTO getCourseByID(@PathVariable("courseid") String courseid);

}
