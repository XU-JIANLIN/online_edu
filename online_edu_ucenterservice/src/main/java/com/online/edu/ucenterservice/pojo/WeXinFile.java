package com.online.edu.ucenterservice.pojo;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@Component
@Data
public class WeXinFile {

    @Value("${wx.open.app_id}")
    private String appId;

    @Value("${wx.open.app_secret}")
    private String appSecret;
}
