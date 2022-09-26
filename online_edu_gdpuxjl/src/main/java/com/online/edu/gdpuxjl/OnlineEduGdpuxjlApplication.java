package com.online.edu.gdpuxjl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication

@ComponentScan(basePackages={"com.online.edu.gdpuxjl","com.online.edu.common"})
@EnableFeignClients
public class OnlineEduGdpuxjlApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlineEduGdpuxjlApplication.class, args);
    }

}
