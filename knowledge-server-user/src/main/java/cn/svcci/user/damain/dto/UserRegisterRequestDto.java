package cn.svcci.user.damain.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;


/**
 * <p>
 *     用户注册请求数据传输对象
 * </p>
 */
@Data
public class UserRegisterRequestDto {

    @Schema(description = "用户名", example = "johnDoe")  // 用于Swagger API文档显示，提供示例值
    @NotBlank(message = "用户名是必填的")
    @Size(min = 3, max = 50, message = "用户名长度必须在3到50个字符之间")
    private String username;  // 用户名，不能为空，长度限制

    @Schema(description = "邮箱", example = "john.Doe@example.com")  // 用于Swagger API文档显示，提供示例值
    @Email(message = "邮箱格式无效")
    @NotBlank(message = "邮箱是必填的")
    private String email;  // 邮箱，不能为空，且格式必须正确

    @Schema(description = "密码", example = "password123")  // 用于Swagger API文档显示，提供示例值
    @NotBlank(message = "密码是必填的")
    @Size(min = 8, message = "密码长度必须至少为8个字符")
    private String password;  // 密码，不能为空，长度限制

}
