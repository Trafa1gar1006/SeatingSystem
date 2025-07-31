package com.esun.seating;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {
    "com.example.seating.controller",
    "com.example.seating.service",
    "com.example.seating.repository"
})
public class SeatingApplication {
    public static void main(String[] args) {
        SpringApplication.run(SeatingApplication.class, args);
    }
}
