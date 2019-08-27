package com.spring.boot.sensor.admin.controller;

import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.service.AdminTwoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    public AdminService adminService;

    @Autowired
    public AdminTwoService adminTwoService;

    @RequestMapping("/")
    public String index(Model model) {
        ParameterM parameterM = new ParameterM();
        model.addAttribute("resources", adminTwoService.resourceList(parameterM).getData());
        model.addAttribute("projects", adminTwoService.projectList(parameterM).getData());
        model.addAttribute("suppliers", adminTwoService.supplierList(parameterM).getData());
        model.addAttribute("count", adminTwoService.count(parameterM).getData());
        return "index";
    }

    @RequestMapping("page-login")
    public String login() {
        return "page-login";
    }
}
