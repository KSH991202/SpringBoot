package com.study.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

// import org.springframework.boot.SpringApplication;
import com.study.di.beans.*;

// @SpringBootApplication
public class DiApplication {

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);

		Login obj = context.getBean("MemberLogin", Login.class);

		obj.login("ksh", "1234");
	}

}
