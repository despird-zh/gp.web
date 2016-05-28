package com.gp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.gp.core.AppContextListener;

@Configuration
@PropertySource("classpath:/spring-context.properties")
@ImportResource({
		"classpath:/spring-datasource.xml",
		"classpath:/spring-shiro.xml",
	})
@ComponentScan(basePackages = { 
		"com.gp.core"
 })
public class RootConfigurer {
	
	@Autowired(required=true)
	private Environment env;
	
	@Bean
	AppContextListener initListener(){
		
		return new AppContextListener();
	}	
}