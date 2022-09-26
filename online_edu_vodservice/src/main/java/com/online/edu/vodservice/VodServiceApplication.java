package com.online.edu.vodservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * @描述：
 * @作者： 许JIAN林
 */

@SpringBootApplication
@EnableEurekaClient
public class VodServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(VodServiceApplication.class, args);
    }
}
