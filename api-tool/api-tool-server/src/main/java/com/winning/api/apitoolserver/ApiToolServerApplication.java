package com.winning.api.apitoolserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;



@SpringBootApplication
@ComponentScan(basePackages = {"com.winning.api"})
@EntityScan(basePackages = {"com.winning.api.apitoolentity"})
@EnableJpaRepositories(basePackages = {"com.winning.api.apitooldao"})
public class ApiToolServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApiToolServerApplication.class, args);
    }

}

