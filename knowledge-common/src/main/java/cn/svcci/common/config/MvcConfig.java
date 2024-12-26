package cn.svcci.common.config;

import cn.svcci.common.interceptors.UserInfoInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //默认拦截所有请求，排除登录注册接口
        registry.addInterceptor(new UserInfoInterceptor()).excludePathPatterns("/api/user/login","/api/user/register");
    }
}
