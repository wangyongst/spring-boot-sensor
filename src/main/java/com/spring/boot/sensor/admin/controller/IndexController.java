package com.spring.boot.sensor.admin.controller;

import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    public AdminService adminService;

    @RequestMapping("/")
    public String index(Model model) {
        ParameterM parameterM = new ParameterM();
        return "index";
    }

    @RequestMapping("page-login")
    public String login() {
        return "page-login";
    }
}
