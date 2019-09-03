package com.spring.boot.sensor.admin.controller;

import com.spring.boot.sensor.entity.Blacklist;
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
    public String zuzhijiagouguanlimodal(Integer id, Integer look, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("dept", adminService.dept(parameterM).getData());
            if (look != null && look == 1) return "modal/zuzhijiagouguanli-look";
            return "modal/zuzhijiagouguanli-update";
        }
        return "modal/zuzhijiagouguanli-new";
    }

    @RequestMapping("/modal/caidananniugongnengguanli1")
    public String caidananniugongnengguanli1(Integer id, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("permission", adminService.permission(parameterM).getData());
            return "modal/caidananniugongnengguanli1-update";
        }
        return "modal/caidananniugongnengguanli1-new";
    }

    @RequestMapping("/modal/caidananniugongnengguanli")
    public String caidananniugongnengguanli(Integer id, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("permission", adminService.permission(parameterM).getData());
            return "modal/caidananniugongnengguanli-update";
        }
        return "modal/caidananniugongnengguanli-new";
    }

    @RequestMapping("/modal/juesequanxian")
    public String juesequanxian(Integer id, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("role", adminService.role(parameterM).getData());
            return "modal/juesequanxian-update";
        }
        return "modal/juesequanxian-new";
    }

    @RequestMapping("/modal/yonghuguanli")
    public String yonghuguanli(Integer id, Model model) {
        if (id != null && id != 0) {
            ParameterM parameterM = new ParameterM();
            parameterM.setId(id);
            model.addAttribute("user", adminService.user(parameterM).getData());
            return "modal/yonghuguanli-update";
        }
        return "modal/yonghuguanli-new";
    }

}
