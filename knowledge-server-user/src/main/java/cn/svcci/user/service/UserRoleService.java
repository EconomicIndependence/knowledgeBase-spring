package cn.svcci.user.service;

import cn.svcci.user.damain.entity.User;
import cn.svcci.common.response.Result;
import cn.svcci.user.damain.entity.UserRole;
import com.baomidou.mybatisplus.extension.service.IService;

public interface UserRoleService extends IService<UserRole> {

    // 分配默认角色 addDefaultUserRole
    Result<String> addDefaultUserRole(User user);
}
