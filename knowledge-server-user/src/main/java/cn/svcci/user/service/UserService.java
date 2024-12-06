package cn.svcci.user.service;

import cn.svcci.api.dto.UserDto;
import cn.svcci.user.damain.dto.*;
import cn.svcci.user.damain.entity.User;
import cn.svcci.common.response.Result;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.validation.Valid;

public interface UserService extends IService<User> {

    //用户注册方法
    Result<String> register(@Valid UserRegisterRequestDto request);
    //用户登录方法
    Result<String> login(@Valid UserLoginRequestDto request);
    //用户更新方法
    Result<String> updateUserProfile(@Valid UserProfileUpdateRequestDto request);

    Result<UserDto> queryUserProfile(@Valid UserQueryRequestDto request);

    Result<String> changePassword(@Valid UserChangePasswordRequestDto request);
}
