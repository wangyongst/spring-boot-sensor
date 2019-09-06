package com.spring.boot.sensor.config.interceptor;

import com.spring.boot.sensor.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LogsInterceptor implements HandlerInterceptor {

    @Autowired
    public AdminService adminService;

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        adminService.createLog(httpServletRequest.getMethod(), httpServletRequest.getRequestURI(),httpServletRequest.getRemoteAddr());
    }
}
