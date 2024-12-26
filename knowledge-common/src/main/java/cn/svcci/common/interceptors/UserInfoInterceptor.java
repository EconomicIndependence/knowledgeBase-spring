package cn.svcci.common.interceptors;

import cn.svcci.common.utils.UserContext;
import com.github.xiaoymin.knife4j.core.util.StrUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class UserInfoInterceptor implements HandlerInterceptor {

    // 在请求处理之前进行调用（Controller方法调用之前）
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String userInfo = request.getHeader("user-info");
        if (StrUtil.isNotBlank(userInfo)) {
            // 将用户信息放入到上下文中,并进行类型转换，因为请求头只能传字符串
            UserContext.setUserId(Long.valueOf(userInfo));

        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        UserContext.removeUser();
    }


}
