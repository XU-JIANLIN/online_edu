package com.online.edu.payservice;

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
@EnableEurekaClient
@EnableFeignClients
@ComponentScan(basePackages={"com.online.edu.payservice","com.online.edu.common"})
public class PayServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(PayServiceApplication.class, args);
    }
}
