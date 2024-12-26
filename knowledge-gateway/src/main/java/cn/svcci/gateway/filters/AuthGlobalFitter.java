package cn.svcci.gateway.filters;



import cn.svcci.common.config.JwtConfig;
import cn.svcci.common.utils.JwtTool;
import cn.svcci.gateway.config.AuthProperties;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.HttpHandler;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Component
public class AuthGlobalFitter implements GlobalFilter, Ordered {

    private final AuthProperties authProperties;
    private final JwtConfig jwtConfig;
//    private final HttpHandler httpHandler;
    // 路径匹配器
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    // TODO: 实现登录拦截器
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        // 获取请求
        ServerHttpRequest request = exchange.getRequest();

        //        判断是否需要登录拦截
        if (isExclude(request.getPath().toString())) {
            return chain.filter(exchange);
        }
        log.info("开始解析JWT");
        String token = null;
        List<String> headers = request.getHeaders().get("authorization");
        log.info("headers: {}", headers);
        if (headers != null && !headers.isEmpty()) {
            token = headers.get(0);
            log.info("token: {}", token);
        }
        Claims userInfo;
        try {
            //签名验证请注意，目前签名的两个参数都是从不同的配置文件中读取的，如果需要修改，请注意同时修改
            String jwtString = token.replace("Bearer ", "").trim();  // 去除 Bearer 前缀

            userInfo = JwtTool.parseJWT(jwtConfig.getSecret(), jwtString);
            log.info("userInfo: userId:{}", userInfo.get("userId"));
            log.info("userInfo: username:{}", userInfo.get("username"));

        } catch (Exception e) {
            ServerHttpResponse response = exchange.getResponse();
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            log.error("JWT parsing failed: {}", e.getMessage(), e);
            return response.setComplete();

        }
        String userId = userInfo.get("userId").toString();

        ServerWebExchange serverWebExchange = exchange.mutate()
                .request(builder -> builder.header("user-info", userId))
                .build();
        return chain.filter(serverWebExchange);
    }

    private boolean isExclude(String path) {
        log.info("开始判断是否需要登录拦截path: {}", path);
        for (String pathPattern : authProperties.getExcludePaths()) {
            if (antPathMatcher.match(pathPattern, path)) {
                return true;
            }
        }

        return false;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
