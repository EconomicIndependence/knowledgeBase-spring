package cn.svcci.user.damain.dto;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * <p>
 *     用户查询请求DTO
 *     暂留以防拓展
 * </p>
 */
@Data
public class UserQueryRequestDto {

    @NotNull(message = "userId不能为空")
    private Long userId;      // 用户ID，必须上传
//    private String username;  // 用户名，可选
//    private String email;     // 用户邮箱，可选

//    @AssertTrue(message = "至少提供一个查询条件（userId、username 或 email）")
//    public boolean isValid() {
//        return userId != null || (username != null && !username.isEmpty()) ||
//                (email != null && !email.isEmpty());
//    }

}
