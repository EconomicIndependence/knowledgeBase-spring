package cn.svcci.common.utils;

//ThreadLocal用于记录当前登录用户信息
public class UserContext {

    private static final ThreadLocal<Long> userContextHolder = new ThreadLocal<>();

    //保存当前登录用户信息到ThreadLocal中
    public static void setUserId(Long userId) {
        userContextHolder.set(userId);
    }

    //从ThreadLocal中获取当前登录用户信息
    public static Long getUserId() {
        return userContextHolder.get();
    }

    public static void removeUser() {
        userContextHolder.remove();
    }
}
