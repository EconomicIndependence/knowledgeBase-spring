package cn.svcci.user.service.impl;

import cn.svcci.user.damain.entity.User;
import cn.svcci.user.damain.entity.UserRole;
import cn.svcci.user.mapper.UserRoleMapper;
import cn.svcci.common.response.Result;
import cn.svcci.user.service.UserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

    private final UserRoleMapper userRoleMapper;

    @Autowired
    public UserRoleServiceImpl(UserRoleMapper userRoleMapper) {
        this.userRoleMapper = userRoleMapper;
    }

    // 分配默认角色 addDefaultUserRole
    @Override
    public Result<String> addDefaultUserRole(User user) {
        Long userId = user.getId();
        log.info("分配默认角色给用户：{}", userId);
        UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(1L);
        boolean saveSuccess = save(userRole);

        if (saveSuccess) {
            log.info("分配默认角色成功！");
            return Result.success("分配默认角色成功！");

        }
        log.error("分配默认角色失败！");
        return Result.error("分配默认角色失败！");

    }
}