package cn.svcci.user.damain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * <p>
 *     用户信息更新请求数据传输对象
 *     id: 用户ID，用于标识需要更新的用户(必填)
 * </p>
 *         修改项包括：
 *         1. 用户名(可选)
 *         2. 用户邮箱（可选）
 *         3. 用户头像(可选)
 *
 */
@Data
public class UserProfileUpdateRequestDto {

    @NotNull(message = "用户ID是必填项")  // 添加用户ID，不能为空
    private Long id;  // 用户ID，用于标识需要更新的用户

    private String username;  // 用户名

    @Email(message = "邮箱格式无效")  // 校验邮箱格式
    private String email;  // 用户邮箱
    private String image;  // 头像，允许为空

//    private Integer status;  // 用户状态，允许为空，因为前端不显示用户状态，所以不进行上传
}
