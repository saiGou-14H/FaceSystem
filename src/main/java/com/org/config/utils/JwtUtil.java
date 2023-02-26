package com.org.config.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @description: Jwt工具类，生成JWT和认证
 * @author: B.M
 */
@Component
public class JwtUtil {

    private static final Logger logger = LoggerFactory.getLogger(JwtUtil.class);
    /**
     * 密钥
     */
    private static final String SECRET = "my_secret";

    /**
     * 过期时间
     **/
    private static final long EXPIRATION = 3600L;                   //单位为毫秒

    /**
     * 生成用户token,设置token超时时间
     */
    public static String createToken(Integer userId,String email,String userName) {
        //过期时间
        Date expireDate = new Date(System.currentTimeMillis() + EXPIRATION * 1000*24);  //过期时间为1天
        Map<String, Object> map = new HashMap<>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        String token = JWT.create()
                .withHeader(map)// 添加头部
                //可以将基本信息放到claims中
                .withClaim("userid",userId)         //userId
                .withClaim("email", email)   //email
                .withClaim("username", userName)//password
                .withExpiresAt(expireDate)       //超时设置,设置过期的日期
                .withIssuedAt(new Date())           //签发时间
                .sign(Algorithm.HMAC256(SECRET)); //SECRET加密
        return token;
    }

    /**
     * 校验token并解析token
     */
    public static Map<String, Claim> verifyToken(String token) {
        DecodedJWT jwt = null;
        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SECRET)).build();
            jwt = verifier.verify(token);
        } catch (Exception e) {
//            logger.error(e.getMessage());
//            logger.error("token解码异常");
            //解码异常则抛出异常
            return null;
        }
        return jwt.getClaims();
    }

    public static Integer getUserId(HttpServletRequest request) {
        String token = request.getHeader("token");
        Map<String, Claim> userData = JwtUtil.verifyToken(token);         //解析token
        return userData.get("userid").asInt();
    }
    public static String getUserName(HttpServletRequest request) {
        String token = request.getHeader("token");
        Map<String, Claim> userData = JwtUtil.verifyToken(token);         //解析token
        return userData.get("username").asString();
    }
    public static String getEmail(HttpServletRequest request) {
        String token = request.getHeader("token");
        Map<String, Claim> userData = JwtUtil.verifyToken(token);         //解析token
        return userData.get("email").asString();
    }

    public static void main(String[] args) {
        Map<String, Claim> userData = JwtUtil.verifyToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwYXNzd29yZCI6IjEyMzQ1NiIsImlkIjoxLCJ1c2VyTmFtZSI6IjIxMDU1ODQ2MDJAcXEuY29tIiwiZXhwIjoxNjU1NTc3MDAyLCJpYXQiOjE2NTU1NzM0MDJ9.gg4CXeJjHRRfzV0DVqhAD7O4kf92_QVFCfIrHcF8SeQ");
        if (userData == null) {
            System.out.println("已过期");
        }
        else {
            /*把token中包含的键值打印出来*/
            for (Map.Entry<String, Claim> entry : userData.entrySet()) {
                System.out.print(entry.getKey() + "  ");
                System.out.println(entry.getValue());
            }

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            /*从token中拿用户的信息*/
            Integer id = userData.get("id").asInt();
            String userName = userData.get("userName").asString();
            String password = userData.get("password").asString();

            System.out.println("id:" + id);
            System.out.println("userName:" + userName);
            System.out.println("password:" + password);
            System.out.println("创建时间iat:" + format.format(userData.get("iat").asDate()));
            System.out.println("过期时间exp:" + format.format(userData.get("exp").asDate().getTime()));
        }
    }

}