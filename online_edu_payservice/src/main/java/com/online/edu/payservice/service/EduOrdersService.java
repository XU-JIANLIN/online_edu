package com.online.edu.payservice.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.OrderInfoVO;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.OrderQuery;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.payservice.VO.AlipayVO;
import com.online.edu.payservice.pojo.EduOrders;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-04-14
 */
public interface EduOrdersService extends IService<EduOrders> {

    AlipayVO setOrderInfo(String memberID, CourseInfoDTO courseByID);

    boolean updateOrderInfo(String out_trade_no, String trade_no);

    String getCourseId(String out_trade_no);


    IPage<OrderInfoVO> getlistOrders(Page page, OrderQuery orderQuery);
}
