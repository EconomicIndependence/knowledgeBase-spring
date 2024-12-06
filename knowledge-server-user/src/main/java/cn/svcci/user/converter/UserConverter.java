package cn.svcci.user.converter;


import cn.svcci.api.dto.UserDto;
import cn.svcci.user.damain.entity.User;
import lombok.extern.slf4j.Slf4j;


@Slf4j
public class UserConverter {


    // 将 UserDto 转换为 User  TODO 未完善
    public static User toUser(UserDto userDto) {
        log.info("开始转换 UserDto to User");
        if (userDto == null) {
            return null;
        }
        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setImage(userDto.getImage());
//        user.setCreatedAt(LocalDateTime.now());  // 默认值（创建时间）
//        user.setUpdatedAt(LocalDateTime.now());  // 默认值（更新时间）
//        user.setIsActive(0);  // 默认用户状态，
        log.info("转换完成");
        return user;
    }

    // 将 User 转换为 UserDto
    public static UserDto toUserDto(User user) {
        log.info("开始转换 User to UserDto");
        if (user == null) {
            log.error("user 为空");
            return null;
        }
        UserDto userDto = new UserDto();
        userDto.setUsername(user.getUsername());
        userDto.setEmail(user.getEmail());
        userDto.setImage(user.getImage());
        log.info("转换完成");
        return userDto;
    }
}
