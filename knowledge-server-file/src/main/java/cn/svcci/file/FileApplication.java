package cn.svcci.file;

import cn.svcci.api.config.DefaultFeignConfig;
import cn.svcci.api.config.FeignConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

//控制feign客户端的扫描路径和日志级别,下方配置未配置日志级别，一般不开启
//@EnableFeignClients(basePackages = "cn.svcci.api.client" , defaultConfiguration = FeignConfig.class)
@EnableFeignClients(basePackages = "cn.svcci.api.client", defaultConfiguration = DefaultFeignConfig.class)
@EnableDiscoveryClient
@MapperScan("cn.svcci.file.mapper")
@SpringBootApplication
public class FileApplication {
    public static void main(String[] args) {

        SpringApplication.run(FileApplication.class, args);
    }

}
