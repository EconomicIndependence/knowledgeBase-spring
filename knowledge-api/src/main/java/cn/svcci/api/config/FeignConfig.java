package cn.svcci.api.config;

import cn.svcci.api.decoder.ResultDecoder;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.codec.Decoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignConfig {

    @Bean
    public Decoder feignDecoder(ObjectMapper objectMapper) {
        return new ResultDecoder(objectMapper);
    }
}
