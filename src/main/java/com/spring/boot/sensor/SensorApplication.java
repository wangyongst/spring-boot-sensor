package com.spring.boot.sensor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableJpaRepositories(basePackages = {"com.spring.boot.sensor.repository"})
@EntityScan(basePackages = {"com.spring.boot.sensor.entity"})
@ServletComponentScan
@EnableScheduling
public class SensorApplication {
    public static void main(String[] args) {
        SpringApplication.run(SensorApplication.class, args);
    }
}
