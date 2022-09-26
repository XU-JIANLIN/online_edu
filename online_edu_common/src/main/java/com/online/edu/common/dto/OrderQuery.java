package com.online.edu.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @描述： 数据传输对象
 *          对装前端传过来的数据内容
 * @作者： 许JIAN林
 */

@ApiModel(value = "订单列表查询对象", description = "订单列表查询对象")
@Data
public class OrderQuery {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "用户账号")
    private String mobile;

    @ApiModelProperty(value = "课程名")
    private String title;

    @ApiModelProperty(value = "支付状态")
    private Integer tradeStatus;

    @ApiModelProperty(value = "查询开始时间", example = "2019-01-01 10:10:10")
    private String begin;//注意，这里使用的是String类型，前端传过来的数据无需进行类型转换

    @ApiModelProperty(value = "查询结束时间", example = "2019-12-01 10:10:10")
    private String end;
}
