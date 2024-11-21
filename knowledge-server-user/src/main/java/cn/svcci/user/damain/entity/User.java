package cn.svcci.user.damain.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data  // 自动生成 getters 和 setters
@NoArgsConstructor  // 自动生成无参构造器
@AllArgsConstructor  // 自动生成全参构造器
@TableName("users")
public class User {

    @TableId
    private Long id;  // 用户唯一标识（主键，递增 ID）

    private String username;  // 用户名，唯一，大小写不敏感

    private String email;  // 用户邮箱，唯一

    private String password;  // 用户密码（加密过）

    private String image;  // 用户头像(未上传则由应用层提供默认头像)

    //@TableField(fill = FieldFill.INSERT) 已经在数据库逻辑中执行自动插入不需要mybatis执行
    private LocalDateTime createdAt;  // 记录创建时间

    //@TableField(fill = FieldFill.INSERT_UPDATE) 已经在数据库逻辑中执行自动插入不需要mybatis执行
    private LocalDateTime updatedAt;  // 记录最后更新时间

    private Integer isActive;  // 用户状态（0：活跃，1：封禁，2：其他状态）
}
