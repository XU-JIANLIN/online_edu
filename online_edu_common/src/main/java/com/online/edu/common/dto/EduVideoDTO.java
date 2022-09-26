package com.online.edu.common.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

//小节的dto对象
@Data
public class EduVideoDTO {

    @ApiModelProperty(value = "小节id")
    private String id;
    @ApiModelProperty(value = "小节名称")
    private String title;
    @ApiModelProperty(value = "是否可以试听：0免费 1收费")
    private Boolean isFree;
    @ApiModelProperty(value = "阿里云视频资源ID")
    private String videoSourceId;
    @ApiModelProperty(value = "云服务器上存储的视频文件名称")
    private String videoOriginalName;
}
