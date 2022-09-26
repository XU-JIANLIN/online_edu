package com.online.edu.common.VO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * 返回前端的订单信息
 */
@Data
public class OrderInfoVO {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "订单id")
    private String id;

    @ApiModelProperty(value = "用户id")
    private String memberId;

    @ApiModelProperty(value = "用户账号")
    private String mobile;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "课程id")
    private String courseId;

    @ApiModelProperty(value = "课程名")
    private String title;

    @ApiModelProperty(value = "交易状态 0:未支付，1已支付")
    private Integer tradeStatus;

    @ApiModelProperty(value = "总支付金额")
    private String totalAmount;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "支付时间")
    private Date gmtModified;
}
