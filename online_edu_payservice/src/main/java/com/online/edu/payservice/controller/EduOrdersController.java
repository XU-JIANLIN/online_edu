package com.online.edu.payservice.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.OrderInfoVO;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.OrderQuery;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.payservice.pojo.EduOrders;
import com.online.edu.payservice.service.EduOrdersService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-04-14
 */
@RestController
@RequestMapping("/payservice/orders")
@Slf4j
@CrossOrigin
public class EduOrdersController {

    @Autowired
    private EduOrdersService ordersService;

    /**  根据不同的条件查询讲师，分页显示 。*/
    @ApiOperation(value = "分页订单列表")
    @PostMapping("{page}/{limit}")
    public ResultVO pageList(
            HttpServletResponse response,
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "teacherQuery", value = "查询对象", required = false)
            @RequestBody( required = false) OrderQuery orderQuery){

        log.info("获取订单列表信息");
        log.info("orderQuery=" +orderQuery.toString());
        //封装page分页对象
        Page<EduOrders> pageParam = new Page<>(page, limit);

        IPage<OrderInfoVO> orderpage = ordersService.getlistOrders(pageParam, orderQuery);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("total", orderpage.getTotal());
        map.put("items", orderpage.getRecords());
        return  ResultVOUtil.success(map);
    }
    /** 根据 ID 删除订单 */
    @ApiOperation(value = "删除订单")
    @DeleteMapping("{id}")
    public ResultVO removeById(@PathVariable String id){
        log.info("【删除订单】 删除id为："+id+"的订单");
        if(ordersService.removeById(id) ){
            return ResultVOUtil.success();
        }else{
            return ResultVOUtil.error( ResultEnum.ERROR);
        }
    }


}

