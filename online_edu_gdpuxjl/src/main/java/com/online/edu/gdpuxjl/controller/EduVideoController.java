package com.online.edu.gdpuxjl.controller;


import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduVideo;
import com.online.edu.gdpuxjl.service.EduVideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.xml.transform.Result;

/**
 * <p>
 * 课程视频 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@RestController
@RequestMapping("/online/video")
@CrossOrigin
@Slf4j
public class EduVideoController {

    @Autowired
    private EduVideoService eduVideoService;
    //添加小节
    @PostMapping("addVideo")
    public ResultVO addVideo(@RequestBody EduVideo eduVideo) {
        boolean save = eduVideoService.save(eduVideo);
        if(save) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    //根据id查询
    @GetMapping("{videoId}")
    public ResultVO getVideoId(@PathVariable String videoId) {
        EduVideo eduVideo = eduVideoService.getById(videoId);
        return ResultVOUtil.success("eduVideo",eduVideo);
    }

    //修改的方法
    @PostMapping("updateVideo")
    public ResultVO updateVideo(@RequestBody EduVideo eduVideo) {
        boolean result = eduVideoService.updateById(eduVideo);
        if(result) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    //删除操作, 根据小节id，删除小节
    @DeleteMapping("{videoId}")
    public ResultVO deleteVideoId(@PathVariable String videoId) {
        log.info("【删除小节】 删除小节id为：" + videoId +"的视频");
        boolean flag = eduVideoService.removeVideo(videoId);
        if(flag) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

}

