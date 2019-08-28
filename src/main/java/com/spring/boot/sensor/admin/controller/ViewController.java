package com.spring.boot.sensor.admin.controller;

import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.ThymeleafUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @Autowired
    public AdminService adminService;

    @RequestMapping("/caidananniugongnengguanli")
    public String caidananniugongnengguanli() {
        return "caidananniugongnengguanli";
    }

    @RequestMapping("/quyuguanli")
    public String quyuguanli() {
        return "quyuguanli";
    }


    @RequestMapping("/juesequanxian")
    public String juesequanxian() {
        return "juesequanxian";
    }

    @RequestMapping("/xitongbaimingdan")
    public String xitongbaimingdan() {
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
