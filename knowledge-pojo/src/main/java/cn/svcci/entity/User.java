package cn.svcci.entity;

import cn.svcci.enumeration.UserStatus;
import co.elastic.clients.util.DateTime;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

/**
 * UserEntity
 * 用户状态枚举类
 *   - 正常 active
 *   - 封禁 banned
 * @author rwwr
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    private Integer id; // 主键
    private String username;    // 用户名
    private String password;    // 密码
    private String email;    // 邮箱
    private String phoneNumber; // 手机号

    @Enumerated(EnumType.STRING)
    private UserStatus status;    // 状态

    private DateTime bannedStart;    // 封禁开始时间
    private DateTime bannedEnd;    // 封禁结束时间
    private DateTime createdAt;    // 创建时间
    private DateTime updatedAt;    // 更新时间
}