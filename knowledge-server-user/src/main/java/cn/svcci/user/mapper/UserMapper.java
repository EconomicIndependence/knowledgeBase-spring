package cn.svcci.user.mapper;


import cn.svcci.user.damain.entity.User;
import cn.svcci.user.damain.entity.UserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;


public interface UserMapper extends BaseMapper<User> {

    // 根据用户名查询用户（SecurityConfig登录使用）
    @Select("SELECT * FROM users WHERE username = #{username}")
    User findByUsername(String Username);

}
