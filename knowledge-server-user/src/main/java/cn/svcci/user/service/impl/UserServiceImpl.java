package cn.svcci.user.service.impl;

import cn.svcci.api.dto.UserDto;
import cn.svcci.user.converter.UserConverter;
import cn.svcci.user.damain.dto.*;
import cn.svcci.user.damain.entity.User;
import cn.svcci.user.mapper.UserMapper;
import cn.svcci.common.response.Result;
import cn.svcci.user.service.UserRoleService;
import cn.svcci.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  user 服务实现类
 * </p>
 */
@Service
@Slf4j
public class  UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService  {

    private final PasswordEncoder passwordEncoder;
    private final UserMapper userMapper;
    private final UserRoleService userRoleService;
    // 构造函数
    @Autowired
    public UserServiceImpl(UserMapper userMapper, PasswordEncoder passwordEncoder, UserRoleService userRoleService) {
        this.userMapper = userMapper;
        this.passwordEncoder = passwordEncoder;
        //注册时添加默认角色
        this.userRoleService = userRoleService;
    }

    // 注册用户
    @Override
    @Transactional
    public Result<String> register(UserRegisterRequestDto request) {

        // 检查用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("email", request.getEmail()) // 检查邮箱是否存在
                .or()  // 或条件
                .eq("username", request.getUsername()); // 检查用户名是否存在
        User existingUser = userMapper.selectOne(queryWrapper);
        if (existingUser != null) {

            if (existingUser.getEmail().equals(request.getEmail())) {
                log.error(" 邮箱:{} 已经被注册", request.getEmail());
                return Result.error("邮箱已经被注册");
            }
            if (existingUser.getUsername().equals(request.getUsername())) {
                log.error(" 用户名:{} 的用户已存在", request.getUsername());
                return Result.error("用户名已存在");
            }
        }

        // 创建新用户并加密密码
        User newUser = new User();
        newUser.setUsername(request.getUsername());// 设置用户名
        newUser.setEmail(request.getEmail()); // 设置邮箱
        newUser.setPassword(passwordEncoder.encode(request.getPassword()));  // 加密密码
        newUser.setIsActive(0); // 设置默认状态

        boolean saveSuccess = save(newUser);
        if (saveSuccess) {
            log.info(" 注册成功，用户信息：{}", newUser);

            // 分配默认角色并获取返回结果
            Result<String> roleResult = userRoleService.addDefaultUserRole(newUser);

            if (roleResult.getCode() == 0) {
                // 注册和角色分配都成功
                return Result.success("注册成功");
            } else {
                // 如果角色分配失败，返回错误
                log.error(" 注册失败，角色分配失败，用户信息：{}", newUser);
                return Result.error(roleResult.getMsg());  // 使用角色分配失败的消息
            }
        }

        log.error(" 注册失败，用户信息：{}", newUser);
        return Result.error("注册失败，请稍后再试");
    }

    // 登录验证
    @Override
    public Result<String> login(UserLoginRequestDto request) {
        // 使用 QueryWrapper 查找用户，支持通过邮箱或用户名查询
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(request.getEmail() != null,"email", request.getEmail())
                    .eq(request.getEmail() == null,"username", request.getUsername());

        User user = userMapper.selectOne(queryWrapper);  // 查询单个用户

        if (user == null) {
            return Result.error("用户不存在");
        }

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            log.error(" 邮箱:{} 的用户密码错误", request.getEmail());
            return Result.error("账号或密码错误");
        }

        // 登录成功，返回jwt令牌
        return Result.success("jwt令牌");
    }



    // 用户更新自己的信息
    @Override
    @Transactional  // 确保操作的一致性
    public Result<String> updateUserProfile(UserProfileUpdateRequestDto requestDto) {
        // 1. 只检查前端传递了用户名时，才进行用户名唯一性检查
        if (requestDto.getUsername() != null) {
            // 检查用户名是否已被占用
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username", requestDto.getUsername()); // 检查用户名是否存在
            User existingUser = userMapper.selectOne(queryWrapper);
            if (existingUser != null) {
                return Result.error("用户名已被占用");
            }
        }

        // 2. 更新用户信息
        User user = new User();
        user.setId(requestDto.getId());  // 用户id

        // 动态更新字段，如果前端没有传递某个字段，则不进行更新
        if (requestDto.getUsername() != null) {
            user.setUsername(requestDto.getUsername());
        }
        if (requestDto.getEmail() != null) {
            user.setEmail(requestDto.getEmail());
        }
        if (requestDto.getImage() != null) {
            user.setImage(requestDto.getImage());
        }

        // 使用 updateById 更新用户
        int updateCount = userMapper.updateById(user);

        if (updateCount == 1) {
            log.info(" 更新用户信息成功，用户信息：{}", user);
            return Result.success("更新成功");
        } else {
            log.error(" 更新用户信息失败，用户信息：{}", user);
            return Result.error("更新失败");
        }
    }
    //系统界面查询用户信息
    @Override
    public Result<UserDto> queryUserProfile(UserQueryRequestDto request) {

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", request.getUserId());  // 支持通过id查询

        User user = userMapper.selectOne(queryWrapper);  // 查询单个用户



        // 如果找到了用户，返回结果，否则返回未找到的提示
        if (user != null) {
            // 将用户信息转换为 DTO
            UserDto userDto = UserConverter.toUserDto(user);
            return Result.success(userDto);
        } else {
            return Result.error("未找到匹配的用户");
        }

    }
    //解析主键更快，下面没必要拼接条件
    //.eq("email", request.getEmail())
//                .or()  // 或条件
//                .eq("username", request.getUsername())  // 支持通过用户名进行查询
//                .or()

    // 用户修改密码
    @Override
    public Result<String> changePassword(UserChangePasswordRequestDto request) {
        // 创建 QueryWrapper，用于构建查询条件
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq( "id", request.getId());  // 按用户id查询


        User user = userMapper.selectOne(queryWrapper);
        // 查询用户,根据用户token解析userid的话用户必然存在
//        if (user == null) {
//            return Result.error("用户不存在");
//        }

        // 校验当前密码是否正确
        if (!passwordEncoder.matches(request.getCurrentPassword(), user.getPassword())) {
            return Result.error("当前密码错误");
        }

        // 校验新密码与确认密码是否一致(前端已校验，留着以防万一)
        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            return Result.error("新密码与确认密码不一致");
        }

        // 加密新密码
        String encryptedPassword = passwordEncoder.encode(request.getNewPassword());

        // 更新密码
        user.setPassword(encryptedPassword);
        int updated = userMapper.updateById(user);
        if (updated > 0) {
            return Result.success("密码修改成功");
        } else {
            return Result.error("密码修改失败，请稍后再试");
        }
    }


}


