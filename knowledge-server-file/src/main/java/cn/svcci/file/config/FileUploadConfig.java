package cn.svcci.file.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Set;

@Data
@Component
@ConfigurationProperties(prefix = "file.upload")
public class FileUploadConfig {

    private long maxSize;                   // 最大文件大小
    private Set<String> allowedTypes;       // 允许的文件类型
    private Set<String> allowedMimeTypes;   // 允许的 MIME 类型


}
