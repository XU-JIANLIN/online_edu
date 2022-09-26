package com.online.edu.vodservice.pojo;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@Component
@Data
public class AliyunVodFile {

    @Value("${aliyun.vod.file.keyid}")
    private String keyId;
    @Value("${aliyun.vod.file.keysecret}")
    private String keySecret;

}

