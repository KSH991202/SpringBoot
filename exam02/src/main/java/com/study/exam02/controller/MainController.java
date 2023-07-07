package com.study.exam02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class MainController {

    @GetMapping("/hello")
    public String hello()
    {
        System.out.println("Receive Hello Get Request!!!!~~");
        return "hello";
    }    

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }
    
    @PostMapping("/loginProc")
    public String loginProc(String userID, String userPW)
    {
        System.out.println("id : " + userID);
        System.out.println("PW : " + userPW);

        return "hello";
    }

}
