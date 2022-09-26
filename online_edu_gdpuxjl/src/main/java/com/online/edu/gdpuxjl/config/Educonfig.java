package com.online.edu.gdpuxjl.config;

import com.baomidou.mybatisplus.core.injector.ISqlInjector;
import com.baomidou.mybatisplus.extension.injector.LogicSqlInjector;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@EnableTransactionManagement
@Configuration
@MapperScan("com.online.edu.gdpuxjl.mapper")
public class Educonfig {

    /**
     * 逻辑删除插件
     */

    @Bean
    public ISqlInjector sqlInjector() {
        return new LogicSqlInjector();
    }



    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {

        return new PaginationInterceptor();
    }
}
