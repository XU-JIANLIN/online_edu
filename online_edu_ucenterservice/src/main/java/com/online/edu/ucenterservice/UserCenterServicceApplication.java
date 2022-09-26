package com.online.edu.ucenterservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@SpringBootApplication
@ComponentScan(basePackages={"com.online.edu.ucenterservice","com.online.edu.common"})
@EnableEurekaClient
public class UserCenterServicceApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserCenterServicceApplication.class, args);
    }
}
