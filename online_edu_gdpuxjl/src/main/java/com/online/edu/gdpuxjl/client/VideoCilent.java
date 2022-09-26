package com.online.edu.gdpuxjl.client;

import com.online.edu.common.VO.ResultVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@Component
@FeignClient("edu-vodservice")
public interface VideoCilent {

    //定义调用删除一个视频的方法
    @DeleteMapping(value = "/vidservice/vod/{videoId}")
    public ResultVO removeVideo(@PathVariable("videoId") String videoId);


    //定义调用删除多个视频的方法
    @DeleteMapping("/vidservice/vod/removeMoreVideo")
    public ResultVO removeMoreVideoAlihyun(@RequestParam("videoList") List videoList);
}
