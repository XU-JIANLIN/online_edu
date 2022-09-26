package com.online.edu.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @描述： 数据传输对象
 *          对装前端传过来的数据内容
 * @作者： 许JIAN林
 */

@ApiModel(value = "用户查询对象", description = "用户查询对象封装")
@Data
public class MemberQuery {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "用户账号,模糊查询")
    private String mobile;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "查询开始时间", example = "2019-01-01 10:10:10")
    private String begin;//注意，这里使用的是String类型，前端传过来的数据无需进行类型转换

    @ApiModelProperty(value = "查询结束时间", example = "2019-12-01 10:10:10")
    private String end;
}
