package com.spring.boot.sensor.controller;

import com.spring.boot.sensor.entity.Blacklist;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.mapper.BlacklistMapper;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.SM3Utils;
import com.spring.boot.sensor.utils.result.Result;
import com.spring.boot.sensor.utils.result.ResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;

@CrossOrigin("*")
@RestController
@RequestMapping("/shiro")
public class ShiroController {

    @Autowired
    public AdminService adminService;

    @RequestMapping("/403")
    public Result unauthorizedRole() {
        return ResultUtil.noPermission();
    }

    @PostMapping(value = "/login")
    public Result login(@RequestParam("username") String username, @RequestParam("password") String password, ServletRequest request) {
        String ip = request.getRemoteAddr();
        if (adminService.isInBlack(ip).getStatus() != 1) return ResultUtil.loginFail("你不允许登录！");
        if (StringUtils.isBlank(username)) return ResultUtil.errorWithMessage("登录账号不能为空！");
        if (StringUtils.isBlank(password)) return ResultUtil.errorWithMessage("登录密码不能为空！");
        Result result = adminService.userLogin(username, password);
        if (result.getStatus() == 0) return result;
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, SM3Utils.encrypt(password));
        try {
            subject.login(token);
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            SecurityUtils.getSubject().getSession().setTimeout(-1000l);
            return ResultUtil.loginOK(subject.getSession().getId().toString(), "");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.loginFail("您输入的账户或密码有误，请重新输入！");
        }
    }

    @PostMapping(value = "/logout")
    public void logout() {
    }
}
