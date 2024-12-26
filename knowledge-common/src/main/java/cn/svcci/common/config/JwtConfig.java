package cn.svcci.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "knowledge.jwt")
public class JwtConfig {
    private String secret;
    private long expiration;

}
