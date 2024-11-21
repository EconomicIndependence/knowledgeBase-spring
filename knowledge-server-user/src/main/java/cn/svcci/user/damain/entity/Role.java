package cn.svcci.user.damain.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.util.List;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("roles")
public class Role {

    @TableId
    private Long id;  // 角色唯一标识（主键，递增 ID）

    private String name;  // 角色名称，唯一

    private String description;  // 角色描述

//    @TableField(fill = FieldFill.INSERT) 已经在数据库逻辑中执行自动插入不需要mybatis执行
    private LocalDateTime createdAt;  // 记录创建时间

//    @TableField(fill = FieldFill.INSERT_UPDATE) 已经在数据库逻辑中执行自动插入不需要mybatis执行
    private LocalDateTime updatedAt;  // 记录最后更新时间
}

