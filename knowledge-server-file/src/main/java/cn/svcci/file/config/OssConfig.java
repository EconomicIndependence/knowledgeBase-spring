package cn.svcci.file.config;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 阿里云oss配置
 */
@Data
@Configuration
@RefreshScope
@ConfigurationProperties(prefix = "spring.cloud.alibaba.oss")
public class OssConfig {


    //  accessKeyId 配置作用: 用于标识用户身份的AccessKey
    private String accessKeyId;

    //  accessKeySecret 配置作用: 用于验证用户身份的密钥
    private String accessKeySecret;

    //  endpoint 配置作用: 决定了OSS客户端与OSS服务端的通信域名和端口，例如：http://oss-cn-hangzhou.aliyuncs.com
    private String endpoint;

    private String bucketName; //  bucketName 配置 作用: 存储空间的名称

    @Bean
    public OSS ossClient() {

        return new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
    }
}

