package com.spring.boot.sensor.admin.controller;


import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.excel.PoiExcelExport;
import com.spring.boot.sensor.utils.excel.ServletUtil;
import com.spring.boot.sensor.utils.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    public AdminService adminService;

    @PostMapping("/dept/sud")
    public Result deptSud(@ModelAttribute ParameterM parameterM) {
        return adminService.deptSud(parameterM);
    }

    @GetMapping("/dept")
    public Result dept(@ModelAttribute ParameterM parameterM) {
        return adminService.dept(parameterM);
    }

    @GetMapping("/dept/list")
    public Result deptList(@ModelAttribute ParameterM parameterM) {
        return adminService.deptList(parameterM);
    }

    @PostMapping("/permission/sud")
    public Result permissionSud(@ModelAttribute ParameterM parameterM) {
        return adminService.permissionSud(parameterM);
    }

    @GetMapping("/permission")
    public Result permission(@ModelAttribute ParameterM parameterM) {
        return adminService.permission(parameterM);
    }

    @GetMapping("/permission/list")
    public Result permissionList(@ModelAttribute ParameterM parameterM) {
        return adminService.permissionList(parameterM);
    }

    //账号列表
    @GetMapping("/user/list")
    public Object userList(@ModelAttribute ParameterM parameterM) {
        return adminService.userList(parameterM);
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
        return adminService.roleList(parameterM);
    }

    @GetMapping("/role")
    public Result role(@ModelAttribute ParameterM parameterM) {
        return adminService.role(parameterM);
    }

    //角色增删改
    @PostMapping("/role/sud")
    public Result roleSud(@ModelAttribute ParameterM parameterM) {
        return adminService.roleSud(parameterM);
    }


    @GetMapping("/dept/export")
    public void deptExport(@ModelAttribute ParameterM parameterM, HttpServletRequest req, HttpServletResponse resp) {
        List<Dept> deptList = (List<Dept>) adminService.deptList(parameterM).getData();
        String fileName = "组织机构管理导出.xls";
        ServletUtil su = new ServletUtil(fileName, req, resp);
        su.poiExcelServlet();
        String[] heads = {"组织名称", "组织编码", "备注"};
        String[] cols = {"id", "createtime", "acceptime", "overtime"};
        int[] numerics = {0};
        ServletUtil suresp = new ServletUtil(resp);
        PoiExcelExport<Dept> pee = new PoiExcelExport<>(fileName, heads, cols, deptList, numerics, suresp.getOut());
        pee.exportExcel();
    }

    @GetMapping("/user/export")
    public void userExport(@ModelAttribute ParameterM parameterM, HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = (List<User>) adminService.deptList(parameterM).getData();
        String fileName = "用户管理导出.xls";
        ServletUtil su = new ServletUtil(fileName, req, resp);
        su.poiExcelServlet();
        String[] heads = {"工号", "登录账号", "姓名", "联系电话", "所属部门", "角色"};
        String[] cols = {"workno", "username", "name", "mobile","deptname","rolename"};
        int[] numerics = {0};
        ServletUtil suresp = new ServletUtil(resp);
        PoiExcelExport<User> pee = new PoiExcelExport<>(fileName, heads, cols, userList, numerics, suresp.getOut());
        pee.exportExcel();
    }
}
