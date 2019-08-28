package com.spring.boot.sensor.admin.controller;


import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    public AdminService adminService;

    //我
    @GetMapping("/me")
    public Result me(@ModelAttribute ParameterM parameterM) {
        return adminService.me();
    }

    //账号列表
    @GetMapping("/user/list")
    public Object userList(@ModelAttribute ParameterM parameterM) {
        return adminService.userList(parameterM).getData();
    }

    //账号详情
    @GetMapping("/user")
    public Result user(@ModelAttribute ParameterM parameterM) {
        return adminService.user(parameterM);
    }

    //账号增删改
    @PostMapping("/user/sud")
    public Result userSud(@ModelAttribute ParameterM parameterM) {
        return adminService.userSud(parameterM);
    }

    //角色列表
    @GetMapping("/role/list")
    public Object roleList(@ModelAttribute ParameterM parameterM) {
        return adminService.roleList(parameterM).getData();
    }

    //角色详情
    @GetMapping("/role")
    public Result role(@ModelAttribute ParameterM parameterM) {
        return adminService.role(parameterM);
    }

    //角色增删改
    @PostMapping("/role/sud")
    public Result roleSud(@ModelAttribute ParameterM parameterM) {
        return adminService.roleSud(parameterM);
    }

    //修改密码
    @PostMapping("/changepassword")
    public Result changePassword(@ModelAttribute ParameterM parameterM) {
        return adminService.changePassword(parameterM);
    }
}
