package cn.svcci.user.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 * 加密配置
 */
@Configuration
public class SecurityConfig {

//    private final JwtAuthenticationFilter jwtAuthenticationFilter;
//    private final CustomUserDetailsService customUserDetailsService;
//
//    public SecurityConfig(JwtAuthenticationFilter jwtAuthenticationFilter, CustomUserDetailsService customUserDetailsService) {
//        this.jwtAuthenticationFilter = jwtAuthenticationFilter;
//        this.customUserDetailsService = customUserDetailsService;
//    }


    /**
     * 配置 PasswordEncoder
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 配置 AuthenticationManager
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    /**
     * 配置 SecurityFilterChain
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        //第一种写法csrf -> csrf.disable()，第二种写法AbstractHttpConfigurer::disable
        http.csrf(AbstractHttpConfigurer::disable) // 禁用 CSRF
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/**").permitAll() // 登录/注册等接口允许匿名访问
                        .anyRequest().authenticated() // 其他接口需要认证
                );
//                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class); // 添加 JWT 过滤


        return http.build();
    }

//    /**
//     * 配置 AuthenticationManagerBuilder
//     * 用于配置认证方式，如：内存认证、LDAP认证等
//     * 用于将UserDetailsService(自定义的用户验证逻辑) 和 PasswordEncoder(自定义的密码加密方式) 配置到认证管理器
//     */
//    @Bean
//    public AuthenticationManagerBuilder authenticationManagerBuilder(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
//        authenticationManagerBuilder.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
//        return authenticationManagerBuilder;
//    }
}
