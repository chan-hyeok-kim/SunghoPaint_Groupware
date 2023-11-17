package com.ham.len.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SecurityAccessDeniedHandler implements AccessDeniedHandler {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
		if(request.isUserInRole("USER")){
			response.sendRedirect("/forbidden");
		}else { // USER 권한이 존재하지 않는 경우(인사 등록 후 최초 로그인한 경우)
			response.sendRedirect("/humanresource/updatePassword");
		}
	}
}