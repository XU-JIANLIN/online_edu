package com.online.edu.common.VO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 封装轮播图VO返回给前端
 */

@Data
public class LunbotuVO {
    @ApiModelProperty(value = "轮播图ID")
    private String id;

    @ApiModelProperty(value = "轮播图路径")
    private String photo;

    @ApiModelProperty(value = "轮播图描述")
    private String name;

    @ApiModelProperty(value = "轮播图的点击链接")
    private String cover;
}
