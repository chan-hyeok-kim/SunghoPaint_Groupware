package com.ham.len.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ham.len.interceptors.AdminInterceptor;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class InterceptorConfig implements WebMvcConfigurer {
	
	@Autowired //IOC(Inversion Of Control)
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//method 체이닝
		//적용할 Interceptor 등록
		registry.addInterceptor(adminInterceptor)
		//Interceptor를 적용할 URL 등록
				.addPathPatterns("/code/**")
				.addPathPatterns("/document/**")
				.addPathPatterns("/humanresource/list")
				.addPathPatterns("/humanresource/registration")
				.addPathPatterns("/attendance/list")
				.addPathPatterns("/annual/status")
				.addPathPatterns("/transfer/list")
				.addPathPatterns("/transfer/registration")
				.addPathPatterns("/apporval/totalList")
				.addPathPatterns("/apporval/update")
				.addPathPatterns("/apporval/delete")
				.addPathPatterns("/sales/assetManagement")
				.addPathPatterns("/sales/assetManagementDetail")
				.addPathPatterns("/notice/**")
				
		//제외할 URL등록
				.excludePathPatterns("/notice/list")
				.excludePathPatterns("/notice/detail");
			
	
	}

}