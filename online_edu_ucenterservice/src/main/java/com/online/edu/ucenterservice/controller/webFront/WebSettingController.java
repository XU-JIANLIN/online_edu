package com.online.edu.ucenterservice.controller.webFront;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.online.edu.common.VO.LunbotuVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.ucenterservice.pojo.StatisticsLunbotu;
import com.online.edu.ucenterservice.service.StatisticsLunbotuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("ucenter/websetting")
@CrossOrigin
public class WebSettingController {

    @Autowired
    private StatisticsLunbotuService lunbotuService;
    /**
     * 前台获取轮播图
     * @return
     */
    @GetMapping("getlunbotu")
    public ResultVO getLunbotu(){


        List<LunbotuVO> list = lunbotuService.getAllLunbotu();
        return ResultVOUtil.success(list);
    }
}
