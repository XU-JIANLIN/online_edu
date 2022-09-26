package com.online.edu.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@ApiModel(value="课程信息", description="网站课程详情页需要的相关字段")
@Data
public class CourseWebDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	@ApiModelProperty(value = "课程标题")
	private String title;

	@ApiModelProperty(value = "课程销售价格，设置为0则可免费观看")
	private BigDecimal price;


	@ApiModelProperty(value = "销售数量")
	private Long buyCount;

	
}