package com.study.di.beans;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {
    
    @Bean("MemberLogin")
    public Login getLoginInstance()
    {
        return new Login();
    }
}
