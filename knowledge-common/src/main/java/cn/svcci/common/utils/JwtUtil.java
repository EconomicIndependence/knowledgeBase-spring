package cn.svcci.common.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

public class JwtUtil {

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
        // 将 secretKey 转换为 SecretKey 对象，假设使用 HMACSHA256 加密算法
        SecretKey key = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HMACSHA256");

        // 使用 Jwts.parser() 创建一个解析器并解密 JWT 字符串
        JwtParser parser = Jwts.parser()
                .verifyWith(key) // 使用密钥解密 JWT
                .build(); // 创建解析器

        // 解析加密的 JWT 字符串并返回 Claims
        return parser.parseSignedClaims(jwsString).getPayload();
    }
}