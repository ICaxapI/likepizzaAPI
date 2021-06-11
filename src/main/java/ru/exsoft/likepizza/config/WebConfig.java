package ru.exsoft.likepizza.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("**")
                .allowedOrigins("http://localhost:3000", "http://localhost:4200", "http://localhost", "http://noctefury.sknt.ru", "http://noctefury.sknt.ru:1234", "http://noctefury.sknt.ru:4200", "http://olejon.ddns.net", "http://olejon.ddns.net:4200")
                .allowCredentials(true)
                .allowedMethods("*");
    }
}