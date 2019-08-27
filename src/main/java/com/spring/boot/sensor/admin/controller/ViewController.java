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
@RequestMapping("/view")
public class ViewController {

    @Autowired
    public AdminService adminService;


    @RequestMapping("/billdetail-list")
    public String billdetail(@ModelAttribute ParameterM parameterM, Model model) {
        model.addAttribute("billid", parameterM.getBillid());
        model.addAttribute("thymeleafutils", new ThymeleafUtils());
        return "billdetail-list";
    }
}
