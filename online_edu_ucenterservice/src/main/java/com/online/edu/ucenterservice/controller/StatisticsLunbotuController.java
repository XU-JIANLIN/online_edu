package com.online.edu.ucenterservice.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.ucenterservice.pojo.StatisticsLunbotu;
import com.online.edu.ucenterservice.service.StatisticsLunbotuService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 轮播图信息 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-02-06
 */

@RestController
@RequestMapping("/ucenter/lunbotu")
@CrossOrigin //跨域
public class StatisticsLunbotuController {

    @Autowired
    private StatisticsLunbotuService lunbotuService;


    /**
     * 更新轮播图信息
     * @param lunbotu
     * @return
     */
    @PutMapping()
    public ResultVO updateLunbotu(@ApiParam(name = "StatisticsLunbotu", value = "轮播图信息", required = false)
                                      @RequestBody( required = false) StatisticsLunbotu lunbotu){
        boolean flag = lunbotuService.updateById(lunbotu);
        if(flag ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


    /**
     * g根据id查询轮播图信息
     * @param id
     * @return
     */
    @GetMapping("{id}")
    public ResultVO getLunbotuInfo(@PathVariable String id){
        StatisticsLunbotu lunbotu = lunbotuService.getById(id);
        return ResultVOUtil.success(lunbotu);
    }

    /**
     * 添加轮播图
     * @return
     */
    @PostMapping()
    public ResultVO saveLunbotu(@ApiParam(name = "StatisticsLunbotu", value = "轮播图信息", required = false)
                                    @RequestBody( required = false) StatisticsLunbotu lunbotu){
        Integer flag = lunbotuService.addLunbotuInfo(lunbotu);
        if(flag >0){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    /**
     * 根据id删除轮播图
     * @param id
     * @return
     */
    @DeleteMapping("{id}")
    public ResultVO deleLunbotu(@PathVariable String id){
        boolean flag = lunbotuService.removeById(id);
        if (flag) {
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }
    /**
     * 修改轮播图状态
     * @param id
     * @param status
     * @return
     */
    @PutMapping("{id}/{status}")
    public ResultVO setLunbotuStatus(@PathVariable String id, @PathVariable String status){
        boolean flag = lunbotuService.updateStatus(id, status);

        if (flag) {
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    /**
     * 分页查询所有轮播图
     * @return
     */
    @ApiOperation("分页显示轮播图")
    @GetMapping("{page}/{limit}")
    public ResultVO getlunbotu(
                @ApiParam(name = "page", value = "当前页码", required = true)
                @PathVariable Long page,
                @ApiParam(name = "limit", value = "每页记录数", required = true)
                @PathVariable Long limit){

        //构建查询对象
        Page<StatisticsLunbotu> pageParam = new Page<>(page,limit);

        IPage<StatisticsLunbotu> pageInfo = lunbotuService.selectAllLunbotu(pageParam);

        HashMap<Object, Object> map = new HashMap<>();
        map.put("total", pageInfo.getTotal());
        map.put("items", pageInfo.getRecords());
        return ResultVOUtil.success(map);
    }

}

