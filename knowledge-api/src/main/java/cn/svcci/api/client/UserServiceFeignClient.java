package cn.svcci.api.client;

import cn.svcci.api.dto.UserDto;
import cn.svcci.common.response.Result;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "user-service")  // 为服务发现的地址
public interface UserServiceFeignClient {

    /**
     * 查询用户信息
     * @param userId
     * @return
     */
    @GetMapping("/api/user/profile")
    Result<UserDto> queryUserProfile(@RequestParam("userId") Long userId);


}
