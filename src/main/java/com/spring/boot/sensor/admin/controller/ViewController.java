package com.spring.boot.sensor.admin.controller;

import com.spring.boot.sensor.entity.Blacklist;
import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.ThymeleafUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ViewController {

    @Autowired
    public AdminService adminService;

    @RequestMapping("/caidananniugongnengguanli")
    public String caidananniugongnengguanli() {
        return "caidananniugongnengguanli";
    }

    @RequestMapping("/juesequanxian")
    public String juesequanxian() {
        return "juesequanxian";
    }

    @RequestMapping("/xitongbaimingdan")
    public String xitongbaimingdan(Model model) {
        model.addAttribute("black", ((List<Blacklist>) adminService.blacklist(1).getData()).get(0));
        model.addAttribute("white", ((List<Blacklist>) adminService.blacklist(2).getData()).get(0));
        return "xitongbaimingdan";
    }

    @RequestMapping("/xitongrizhi")
    public String xitongrizhi() {
        return "xitongrizhi";
    }

    @RequestMapping("/yonghuguanli")
    public String yonghuguanli() {
        return "yonghuguanli";
    }

    @RequestMapping("/zuzhijiagouguanli")
    public String zuzhijiagouguanli() {
        return "zuzhijiagouguanli";
    }

    @RequestMapping("/modal/zuzhijiagouguanli")
    public String zuzhijiagouguanlimodal(Integer id, Integer look, Integer pid, Integer type, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("dept", adminService.dept(parameterM).getData());
            if (look != null && look == 1) return "modal/zuzhijiagouguanli-look";
            return "modal/zuzhijiagouguanli-update";
        } else if (pid != null && pid != 0) {
            Dept dept = new Dept();
            dept.setpId(pid);
            model.addAttribute("dept", dept);
            return "modal/zuzhijiagouguanli-update";
        }
        return "modal/zuzhijiagouguanli-new";
    }

    @RequestMapping("/modal/caidananniugongnengguanli")
    public String caidananniugongnengguanli(Integer id, Integer look, Integer type, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            Permission permission = (Permission) adminService.permission(parameterM).getData();
            model.addAttribute("permission", permission);
            if (permission.getType() != null && permission.getType() == 1) {
                if (look != null && look == 1) return "modal/caidananniugongnengguanli-look";
                return "modal/caidananniugongnengguanli-update";
            } else {
                if (look != null && look == 1) return "modal/caidananniugongnengguanli1-look";
                return "modal/caidananniugongnengguanli1-update";
            }
        }
        if (type != null && type == 1) {
            return "modal/caidananniugongnengguanli-new";
        } else return "modal/caidananniugongnengguanli1-new";
    }

    @RequestMapping("/modal/juesequanxian")
    public String juesequanxian(Integer id, Integer look, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("role", adminService.role(parameterM).getData());
            if (look != null && look == 1) return "modal/juesequanxian-look";
            return "modal/juesequanxian-update";
        }
        return "modal/juesequanxian-new";
    }

    @RequestMapping("/modal/yonghuguanli")
    public String yonghuguanli(Integer id, Integer look, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            User user = (User) adminService.user(parameterM).getData();
            model.addAttribute("user", user);
            String deptName = "";
            Integer deptid = 0;
            Dept dept = user.getDept();
            if (dept != null) {
                deptName = dept.getName();
                deptid = dept.getId();
            }
            model.addAttribute("deptName", deptName);
            model.addAttribute("deptid", deptid);
            if (look != null && look == 1) return "modal/yonghuguanli-look";
            return "modal/yonghuguanli-update";
        }
        return "modal/yonghuguanli-new";
    }

}