package cn.svcci.user.damain.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user_role")
public class UserRole {

    @TableField("user_id")
    private Long userId;  // 用户 ID，关联到用户表


    @TableField("role_id")
    private Long roleId;  // 角色 ID，关联到角色表

    //@TableField(fill = FieldFill.INSERT) 已经在数据库逻辑中执行自动插入不需要mybatis执行
    private LocalDateTime assignedAt;  // 角色分配时间
}
