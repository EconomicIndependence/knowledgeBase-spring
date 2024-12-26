package cn.svcci.api.config;

import cn.svcci.common.utils.UserContext;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;

/**
 * 请求拦截器
 * 修改服务端的请求头信息，添加用户信息
 */

public class DefaultFeignConfig {

    @Bean
    public feign.Logger.Level feignLoggerLevel() {

        return feign.Logger.Level.FULL;

    }

    @Bean
    public RequestInterceptor userInfoRequestInterceptor() {

        return new RequestInterceptor(){

        @Override
        public void apply (RequestTemplate template){
            Long userId = UserContext.getUserId();
            if (userId!= null) {
                template.header("user-info", userId.toString());
                }
            }
        };
    }
}




