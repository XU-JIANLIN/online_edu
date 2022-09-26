package com.online.edu.gateway;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy   //网关注解
public class EduGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(EduGatewayApplication.class, args);
    }

}
