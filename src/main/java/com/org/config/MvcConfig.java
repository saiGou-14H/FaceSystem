package com.org.config;

import com.org.config.intercepter.GlobalInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class MvcConfig extends WebMvcConfigurationSupport {

    @Override
    /*解决跨域问题*/
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")         //允许任何域名
                .allowedHeaders("*")                //允许任何请求头
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")  //允许方法
                .allowCredentials(true)            //是否支持安全证书
                .maxAge(10000);                       //预检请求的有效期，单位为秒
    }

    @Override
    /*配置拦截器*/
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new GlobalInterceptor())
                .addPathPatterns("/**")                      //拦截全部路径下文件 导出会议数据"/meeting/download"
                .excludePathPatterns("/**");   //除了登录注册 /loRe/login","/loRe/testlogin", "/interact/**
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/banner.txt");
//        System.getProperty("user.dir"); //获取到当前jar的所在路径
//        System.out.println(System.getProperty("user.dir"));
        String property ="File:"+ System.getProperty("user.dir")+"/images/";
        //所以当需要访问上传的图片时，url路径为：http://你的服务器IP:8080/images/book/1.jpg
        registry.addResourceHandler("/images/**").addResourceLocations(property);
        registry.addResourceHandler("/**").
                addResourceLocations(System.getProperty("user.dir") + "/images/");
        super.addResourceHandlers(registry);
    }


}
