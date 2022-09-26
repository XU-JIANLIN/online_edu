package com.online.edu.gdpuxjl.controller;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.utils.ResultVOUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/**
 * @描述：  进行文件上传控制
 * @作者： 许JIAN林
 */
@RestController
@RequestMapping("/online/oss")
@CrossOrigin
@Slf4j
public class FileUploadController {

    /**
     * Endpoint以杭州为例，其它Region请按实际情况填写。
     */
    @Value("${aliyun.endpoint}")
    private String ENDPOINT;
    /**
     * 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建。
     */
    @Value("${aliyun.accesskeyid}")
    private String ACCESSKEYID;

    @Value("${aliyun.accesskeysecret}")
    private String ACCESSKEYSECRET;

    @Value("${aliyun.bucketname}")
    private String BUCKETNAME;

    @ApiOperation(value = "上传文件")
    @PostMapping("fileupload")
    public ResultVO upload(
            @ApiParam( value = "上传文件")
            @RequestParam("file") MultipartFile file,
            @ApiParam(name = "host", value = "文件上传路径", required = false)
            @RequestParam(value = "host", required = false) String host
            ) throws IOException {

        // 1.得到文件的名字

        String fileName = file.getOriginalFilename();

        log.info(" 【上传文件】 上传文件名为：" + fileName);
        // 2.得到文件的输入流
        InputStream fileInputStream = file.getInputStream();
        // 3 拼接文件名, 添加uuid值，保证文件名称不重复
        String uuid = UUID.randomUUID().toString();
        fileName = uuid + fileName ;

        // 4 拼接文件名, 拼接文件完整名称
            // 4.1 获取当前时间 2019/12/07
        String datePath = new DateTime().toString("yyyy/MM/dd");
            // 2019/04/13/agdfegafadafe1.txt
        fileName = datePath + "/" + host+ "/"+ fileName;

        // 5上传阿里云OSS对象储存
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(ENDPOINT, ACCESSKEYID, ACCESSKEYSECRET);
        // 上传文件流。
        ossClient.putObject(BUCKETNAME, fileName, fileInputStream);
        // 关闭OSSClient。
        ossClient.shutdown();

        // 4.返回文件的url地址
        // https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/default.png
        String imaUrl = "https://" + BUCKETNAME + "."+ ENDPOINT + "/" + fileName ;

        return ResultVOUtil.success(imaUrl);
    }

}
