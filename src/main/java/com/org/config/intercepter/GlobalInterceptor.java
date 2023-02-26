package com.org.config.intercepter;

import com.auth0.jwt.interfaces.Claim;
import com.org.config.utils.JwtUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Configuration
public class GlobalInterceptor implements HandlerInterceptor {

    /**
     * return true;执行下一个拦截器，放行；false反之
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @RequestBody String s) throws Exception {
        String token = request.getHeader("token");              //从请求头中获取前端传过来的accessToken
        System.out.println(token);
        System.out.println(s);
        Map<String, Claim> userData = JwtUtil.verifyToken(token);         //解析token
        System.out.println("token是否失效--->"+token);
        if (userData == null) {                         //如果失效
           System.out.println("登录过期");
            return false;
        }

        System.out.println("========拦截前========");
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
        System.out.println("========拦截后========");
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
        System.out.println("========清理========");
    }

}
