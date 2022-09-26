package com.online.edu.payservice.VO;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class AlipayVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private String member_id;

    /**
     * 课程id
     */
    private String course_id;

    /**
     * 订单名称
     */
    private String subject;


    /**
     * 商户网站唯一订单号
     */
    private String out_trade_no;

    /**
     * 该笔订单允许的最晚付款时间
     */
    private String timeout_express;
    
    /**
     * 付款金额
     */
    private BigDecimal total_amount;

    /**
     * 销售产品码，与支付宝签约的产品码名称
     */
    private String product_code;

    // 省略getter和setter
}
