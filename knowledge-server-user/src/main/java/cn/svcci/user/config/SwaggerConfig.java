//package cn.svcci.user.config;
//import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//
//@Configuration
//@EnableKnife4j
//public class SwaggerConfig {
//
//    @Bean
//    public Docket api() {
//        return new Docket(DocumentationType.SWAGGER_2)
//                .apiInfo(new ApiInfoBuilder()
//                        .title("用户服务 API")
//                        .description("提供用户服务的各类操作接口")
//                        .version("v0.0.1")
//                        .build())
//                .select()
//                .apis(RequestHandlerSelectors.basePackage("cn.svcci.user.controller"))
//                .paths(springfox.documentation.builders.PathSelectors.any())
//                .build();
//    }
//}
