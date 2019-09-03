package com.spring.boot.sensor.config;

import com.spring.boot.sensor.config.interceptor.LogsInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfigeration implements WebMvcConfigurer {

    @Autowired
    private LogsInterceptor logsInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration registration = registry.addInterceptor(logsInterceptor);
        registration.addPathPatterns("/**");
    }
}
