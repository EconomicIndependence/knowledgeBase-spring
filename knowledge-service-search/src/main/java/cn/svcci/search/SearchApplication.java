package cn.svcci.search;

import cn.svcci.api.config.DefaultFeignConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.svcci.api.client", defaultConfiguration = DefaultFeignConfig.class)
public class SearchApplication {
    public static void main(String[] args) {

        SpringApplication.run(SearchApplication.class, args);
    }
}
