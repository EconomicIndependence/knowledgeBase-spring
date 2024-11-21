//package cn.svcci.user.service.impl;
//import cn.svcci.user.config.security.CustomUserDetails;
//import cn.svcci.user.damain.entity.User;
//import cn.svcci.user.mapper.UserMapper;
//import cn.svcci.user.service.UserService;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.AuthorityUtils;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * 自定义 UserDetailsService实现类，用于从数据库中获取用户信息并构造 UserDetails 对象
// */
//@Service
//public class CustomUserDetailsService implements UserDetailsService {
//
//    private final UserMapper userMapper;
//
//    public CustomUserDetailsService(UserMapper userMapper) {
//        this.userMapper = userMapper;
//    }
//
//    //没做好，因为角色表和user表的关联
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        // 从数据库获取用户信息
//        User user = userMapper.findByUsername(username);
//        // 如果找不到用户，抛出异常
//        if (user == null) {
//            throw new UsernameNotFoundException("没有找到用户: " + username);
//        }
//
//        // 通过角色构建权限信息（此处为示例，实际需要根据数据库结构来获取角色）
//        // 使用 AuthorityUtils 来简化角色转换
//        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(
//                user.getRoles().stream().map(role -> "ROLE_" + role).toArray(String[]::new)
//        );
//
//        // 构造并返回 CustomUserDetails 对象
//        return new CustomUserDetails(
//                user.getUsername(),
//                user.getPassword(),
//                authorities
//        );
//    }
//}