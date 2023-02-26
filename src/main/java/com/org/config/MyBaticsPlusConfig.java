package com.org.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyBaticsPlusConfig {

    /*分页插件，配置了才能真正分页*/
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.H2));
        return interceptor;
    }

    /*性能分析插件 原先的PerformanceInterceptor已被移除*/
//    @Bean
//    @Profile({"dev", "test"})   //设置dev、test环境开启，保证效率
//    public PerformanceInterceptor tt() {
//        PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
//        performanceInterceptor.setMaxTime(10);  // 单位为毫秒，如果sql执行时间超过这个时间，报错
//        performanceInterceptor.setFormat(true); // 是否格式化代码，它会在控制台格式化sql
//        return performanceInterceptor;
//
//    }

    /*高版本不用逻辑删除组件*/
//    @Bean
//    public ISqlInjector salInjector() {
//        return new LogicSqlInjector();
//    }

}
