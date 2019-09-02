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
}
