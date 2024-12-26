package cn.svcci.common.utils;

import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

@Slf4j
@Component
public class JwtTool {

    /**
     * 创建JWT
     *
     * @param secretKey 密钥
     * @param ttlMillis 过期时间（毫秒）
     * @param claims    自定义信息
     * @return JWT Token
     */
    public static String createJWT(String secretKey, long ttlMillis, Map<String, Object> claims) {
        // 使用HMACSHA256算法创建签名密钥
        SecretKey key = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HMACSHA256");
        log.info(" 加密时的secretKey {}",key);

        // 计算JWT的过期时间
        long expMillis = System.currentTimeMillis() + ttlMillis;
        Date exp = new Date(expMillis);

        // 创建JWT并返回
        JwtBuilder builder = Jwts.builder()
                .claims(claims) // 设置自定义的claims
                .expiration(exp) // 设置过期时间
                .signWith(key); // 设置签名

        // 返回生成的JWT Token
        return builder.compact(); // 生成并返回JWT字符串
    }

    /**
     * 解析JWT
     *
     * @param secretKey 签名密钥
     * @param jwsString 签名后的JWT
     * @return Claims 解析后的内容
     */
    public static Claims parseJWT(String secretKey, String jwsString) {
        try {
            // 将 secretKey 转换为 SecretKey 对象，使用 HMACSHA256 加密算法
            SecretKey key = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HMACSHA256");
            log.info(" secretKey {}",key);

            // 使用 Jwts.parser() 创建一个解析器并解密 JWT 字符串
            JwtParser parser = Jwts.parser()
                    .verifyWith(key) // 使用密钥解密 JWT
                    .build(); // 创建解析器

            // 解析加密的 JWT 字符串并返回 Claims
            return parser.parseSignedClaims(jwsString).getPayload();

        } catch (ExpiredJwtException e) {
            // 捕获 JWT 过期的异常
            log.error("JWT 已过期: {}", e.getMessage());
            throw new RuntimeException("令牌已过期", e);
        } catch (MalformedJwtException e) {
            // 捕获 JWT 格式不正确的异常
            log.error("JWT 格式错误: {}", e.getMessage());
            throw new RuntimeException("JWT 格式错误", e);
        } catch (IllegalArgumentException e) {
            // 捕获非法的 JWT 字符串
            log.error("无效的 JWT 字符串: {}", e.getMessage());
            throw new RuntimeException("无效的 JWT 字符串", e);
        } catch (JwtException e) {
            // 捕获其他与 JWT 相关的所有异常
            log.error("JWT 解析错误: {}", e.getMessage(), e);
            throw new RuntimeException("JWT 解析错误", e);
        } catch (Exception e) {
            // 捕获其他未知异常
            log.error("解析 JWT 时发生意外错误: {}", e.getMessage(), e);
            throw new RuntimeException("解析 JWT 时发生意外错误", e);
        }
    }
}