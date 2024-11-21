package cn.svcci.user.damain.dto;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * UserLoginRequestDto
 *         登录请求参数对象
 *         直接邮箱登录和用户名登录
 *
 */
@Data
public class UserLoginRequestDto {

    @Email(message = "邮箱格式无效")  // 校验邮箱格式是否正确
    private String email;  // 用户邮箱，不能为空且格式必须正确

    @Size(min = 3, max = 50, message = "用户名长度必须在3到50个字符之间")
    private String username;

    @NotBlank(message = "密码是必填项")  // 密码不能为空
    @Size(min = 8, message = "密码长度必须至少为8个字符")  // 密码长度必须大于等于8个字符
    private String password;  // 密码，不能为空，且长度限制

    @AssertTrue(message = "至少提供一个查询条件（userId、username 或 email）")
    public boolean isValid() {

        return username != null || email != null;
    }
}
