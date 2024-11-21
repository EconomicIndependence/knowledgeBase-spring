package cn.svcci.user.damain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 更新密码请求 Dto
 * Change Password Request Dto
 *
 */
@Data
public class UserChangePasswordRequestDto {

    @NotNull(message = "用户id是必填项")
    private Long id;  // 用户 ID

    @NotBlank(message = "当前密码是必填项")
    @Size(min = 8, message = "密码必须至少包含 8 个字符")
    private String currentPassword;  // 当前密码

    @NotBlank(message = "新密码是必填项")
    @Size(min = 8, message = "密码必须至少包含 8 个字符")
    private String newPassword;  // 新密码，至少 8 位字符

    @NotBlank(message = "确认新密码是必填项")
    private String confirmPassword;  // 确认新密码
}

