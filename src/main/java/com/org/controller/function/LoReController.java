package com.org.controller.function;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.org.config.utils.JwtUtil;
import com.org.config.utils.MD5Util;
import com.org.config.utils.MailUtil;
import com.org.model.Result;
import com.org.model.User;
import com.org.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Api(value = "登录注册接口")
@RestController
@RequestMapping("loRe")
public class LoReController {

    @Autowired
    private IUserService userservice;

    @ApiOperation(value = "登录")
    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestBody String data) {
        JwtUtil jwtUtil = new JwtUtil();

        JSONObject jsonObject =  JSON.parseObject(data);
        String email = String.valueOf(jsonObject.get("email"));
        String password = String.valueOf(jsonObject.get("password"));

        QueryWrapper<User> wrapper = new QueryWrapper<>();      //设置查询条件
        wrapper.eq("email",email);
        wrapper.eq("password", MD5Util.getMD5(password));//先转为MD5
        User user = userservice.getOne(wrapper);               //获取指定用户

        Map<String, Object> map = new HashMap<>();
        System.out.println(user);
        if(user != null) {                            //查到有此用户

            String newToken = jwtUtil.createToken(user.getId(), email, user.getUsername());//创建一个token
            //存储用户数据
            map.put("userId", user.getId());
            map.put("userName", user.getUsername());
            map.put("nickname", user.getNickname());
            map.put("token", newToken);

            System.out.println("用户"+user.getId()+"-"+user.getUsername()+"已登录");
            System.out.println("token："+newToken);
        }
        else {return Result.failure(500, "请检查您的账号或密码是否有误");}

        return Result.success(map);                      //返回结果集
    }

    @ApiOperation(value = "登录测试")
    @PostMapping("testlogin")
    @ResponseBody
    public Result testlogin(HttpSession session,
                            @RequestParam("email") String email,
                            @RequestParam("password") String password
        ) {
        JwtUtil jwtUtil = new JwtUtil();

        QueryWrapper<User> wrapper = new QueryWrapper<>();      //设置查询条件
        wrapper.eq("email",email);
        wrapper.eq("password", MD5Util.getMD5(password));//先转为MD5
        User user = userservice.getOne(wrapper);               //获取指定用户

        Map<String, Object> map = new HashMap<>();
        if(user != null) {                            //查到有此用户
            String newToken = jwtUtil.createToken(user.getId(), email, user.getUsername());//创建一个token

            map.put("userId", user.getId());
            map.put("userName", user.getUsername());
            map.put("nickname", user.getNickname());
            map.put("token", newToken);
            /*将用户信息存放在session中*/
            session.setAttribute("userid",user.getId());
            System.out.println("用户"+user.getId()+"已登录");
            session.setAttribute("email",email);
            System.out.println("存进去了"+session.getAttribute("userid"));
            System.out.println("存进去了"+session.getAttribute("email"));
            session.setAttribute("username",user.getUsername());
        }
        else {Result.failure(500, "请检查您的账号或密码是否有误");}

        return Result.success(map);                      //返回结果集
    }

    @ApiOperation(value = "获取验证码")
    @GetMapping("/getVerify")
    public String getVerify(String mail) {

        return new MailUtil().sendSimpleEmail(mail);
    }

//    @RequestMapping("/createMetting")
//    public Result createMetting(@RequestBody String data) {      //跳转到首页
//
//        JSONObject jsonObject =  JSON.parseObject(data);
//        String email = String.valueOf(jsonObject.get("email"));
//        String password = String.valueOf(jsonObject.get("password"));
//
//        JwtUtil jwtUtil = new JwtUtil();
//
//        QueryWrapper<User> wrapper = new QueryWrapper<>();      //设置查询条件
//        wrapper.eq("email",email);
//        wrapper.eq("password",password);
//        User user = userservice.getOne(wrapper);               //获取指定用户
//
//        /*当用户名和密码正确时*/
//        int userid = user.getId();
//        String username = user.getUsername();
//        String nickname = user.getNickname();
//
//        Map<String, Object> map = new HashMap<>();
//        if(userid > 0) {                            //查到有此用户
//            String newToken = jwtUtil.createToken(userid, email, username);//创建一个token
//            map.put("userId", userid);
//            map.put("userName", username);
//            map.put("nickname",nickname);
//            map.put("token", newToken);
//        }
//        else {
//            System.out.println("这里错了");
//        }
//
//        return Result.success(map);
//    }

    @ApiOperation(value = "注销登录")
    @GetMapping("/loginout")
    public Result loginout(HttpSession session) {
        session.removeAttribute("username");
        session.removeAttribute("password");

        if(session.getAttribute("email") != null) {
            return Result.failure(500, "未退出登录");
        }

        return Result.success(200, "已退出登录");
    }

}
