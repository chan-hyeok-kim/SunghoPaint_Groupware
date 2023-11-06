package com.ham.len.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SecuritySuccessHandler implements AuthenticationSuccessHandler{


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
//		log.info("======Authtication:{}===",authentication);
		
		String path = request.getPathInfo();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		
		log.info("======path:{}===",path);
		log.info("======uri:{}===",uri);
		log.info("======url:{}===",url);
		
		
		response.sendRedirect("/");
//		휴면계정 전환 - 로그인 핸들러 사용
//		로그아웃 핸들러도 사용 가능
//		- Logout 기능을 활성화하면 LogoutFilter 가 생김 
//		해당 필터 내부에는 이미 로그아웃 핸들러 존재.
	}

	

	
}
