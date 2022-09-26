package com.online.edu.payservice.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.online.edu.common.VO.OrderInfoVO;
import com.online.edu.payservice.pojo.EduOrders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;


/**
 * <p>
 * 订单表 Mapper 接口
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-04-14
 */

public interface EduOrdersMapper extends BaseMapper<EduOrders> {
    /**
     * 获取订单列表数据
     * @param page 分页工具类继承了Pagination
     * @return
     */
    IPage<OrderInfoVO> getOrderList(IPage page, @Param("ew") Wrapper<EduOrders> wrapper);



}
