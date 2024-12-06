package cn.svcci.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  // 自动生成 getters 和 setters
@NoArgsConstructor  // 自动生成无参构造器
@AllArgsConstructor  // 自动生成全参构造器
public class UserDto {

    private String username;  // 用户名，唯一，大小写不敏感

    private String email;  // 用户邮箱，唯一

    private String image;  // 用户头像(未上传则由应用层提供默认头像)

}
