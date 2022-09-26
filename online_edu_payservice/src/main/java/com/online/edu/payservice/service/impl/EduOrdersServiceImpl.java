package com.online.edu.payservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.OrderInfoVO;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.OrderQuery;
import com.online.edu.payservice.VO.AlipayVO;
import com.online.edu.payservice.client.MemberCourseCilent;
import com.online.edu.payservice.pojo.EduOrders;
import com.online.edu.payservice.mapper.EduOrdersMapper;
import com.online.edu.payservice.service.EduOrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-04-14
 */
@Service
public class EduOrdersServiceImpl extends ServiceImpl<EduOrdersMapper, EduOrders> implements EduOrdersService {

    /**
     * 生成订单信息
     * @param memberID
     * @param courseByID
     * @return
     */

    @Autowired
    MemberCourseCilent memberCourseCilent;
    @Override
    public AlipayVO setOrderInfo(String memberID, CourseInfoDTO courseByID) {
        //生成订单号
        String out_trade_no = UUID.randomUUID().toString().replace("-", "");

        //获取课程id
        String courseID = courseByID.getId();

        //获取付款金额
        BigDecimal total_amount = courseByID.getPrice();

        //获取课程标题
        String title = courseByID.getTitle();

        //新建支付信息,支付信息范围给前台
        AlipayVO alipayVO = new AlipayVO();

        alipayVO.setOut_trade_no(out_trade_no); //订单号
        alipayVO.setTotal_amount(total_amount);//付款金额
        alipayVO.setSubject(title); //商品标题


        //新建订单实体，插入数据库
        EduOrders eduOrders = new EduOrders();
        eduOrders.setCourseId(courseID);
        eduOrders.setMemberId(memberID);
        eduOrders.setOutTradeNo(out_trade_no);
        eduOrders.setTotalAmount(total_amount.toString());

        baseMapper.insert(eduOrders);

        return alipayVO;
    }

    @Override
    public boolean updateOrderInfo(String out_trade_no, String trade_no) {

        //根据订单号查出订单信息
        QueryWrapper<EduOrders> wrapper = new QueryWrapper<>();
        wrapper.eq("out_trade_no",out_trade_no);
        EduOrders eduOrders = baseMapper.selectOne(wrapper);

        //支付成功，将课程写进用户课程表里
        String courseId = eduOrders.getCourseId();
        String memberId = eduOrders.getMemberId();
        memberCourseCilent.saveMemberCourse(memberId,courseId);

        //更新订单信息
        eduOrders.setTradeNo(trade_no);
        eduOrders.setTradeStatus(1); //修改为已购买

        int i = baseMapper.updateById(eduOrders);

        return i>0;
    }

    @Override
    public String getCourseId(String out_trade_no) {
        //根据订单号查出订单信息
        QueryWrapper<EduOrders> wrapper = new QueryWrapper<>();
        wrapper.eq("out_trade_no",out_trade_no);
        EduOrders eduOrders = baseMapper.selectOne(wrapper);

        return eduOrders.getCourseId();
    }

    @Override
    public IPage<OrderInfoVO> getlistOrders(Page page, OrderQuery orderQuery) {
        if (orderQuery == null) {
            //当订单查询条件为空时
            return baseMapper.getOrderList(page,null);
        }
        //新建条件查询对象
        QueryWrapper queryWrapper = new QueryWrapper();
        String mobile = orderQuery.getMobile();
        String title = orderQuery.getTitle();
        Integer tradeStatus = orderQuery.getTradeStatus();
        String begin = orderQuery.getBegin();
        String end = orderQuery.getEnd();
        if ( !StringUtils.isEmpty(mobile)) {
            queryWrapper.like("mobile", mobile);
        }
        if (!StringUtils.isEmpty(title)) {
            queryWrapper.like("title", title);
        }
        if (!StringUtils.isEmpty(tradeStatus)) {
            queryWrapper.eq("trade_status", tradeStatus);
        }
        if (!StringUtils.isEmpty(begin)) {
            queryWrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            queryWrapper.le("gmt_create", end);
        }
        return baseMapper.getOrderList(page,queryWrapper);

    }
}
