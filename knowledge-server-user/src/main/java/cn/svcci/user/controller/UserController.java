package cn.svcci.user.controller;

import cn.svcci.api.dto.UserDto;

import cn.svcci.common.response.Result;
import cn.svcci.user.damain.dto.*;
import cn.svcci.user.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService){
        this.userService = userService;
    }

    // 用户注册
    @PostMapping("/register")
    public Result<String> register(@RequestBody @Valid UserRegisterRequestDto request) {

        return userService.register(request);
    }

    // 用户登录
    @PostMapping("/login")
    public Result<String> login(@RequestBody @Valid UserLoginRequestDto request) {

        return userService.login(request);
    }
    // TODO: 用户信息修改:需要修改，因为无法正确处理头像格式问题
    // 用户信息修改
    @PutMapping("/profile")
    public Result<String> updateUserProfile(@RequestBody @Valid UserProfileUpdateRequestDto request) {

        return userService.updateUserProfile(request);
    }

    // 用户信息查询
    @GetMapping("/profile")
    public Result<UserDto> queryUserProfile(@Valid UserQueryRequestDto request) {

        return userService.queryUserProfile(request);

    }
    //测试信息传递
    @GetMapping("/userinfo")
    public Result<String> queryUserInfo(@RequestHeader(value = "user-info", required = false) String userinfo) {

        return Result.success(userinfo);

    }
    // 用户密码更改
    @PutMapping("/password")
    public Result<String> changePassword(@Valid @RequestBody UserChangePasswordRequestDto request) {
        return userService.changePassword(request);
    }
}


