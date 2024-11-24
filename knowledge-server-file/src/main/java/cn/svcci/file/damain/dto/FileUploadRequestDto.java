
package cn.svcci.file.damain.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传数据传输对象
 * 用于接收客户端上传的文件数据
 */
@Data
public class FileUploadRequestDto {

    @NotNull(message = "文件不能为空")
    private MultipartFile file; // 上传的文件

    @NotNull(message = "用户id是必填项")
    private Long userId; // 上传者用户 ID
}
