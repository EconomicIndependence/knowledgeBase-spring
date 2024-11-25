package cn.svcci.user.service;

import cn.svcci.user.damain.entity.User;
import cn.svcci.common.response.Result;

public interface UserRoleService {

    // 分配默认角色 addDefaultUserRole
    Result<String> addDefaultUserRole(User user);
}
