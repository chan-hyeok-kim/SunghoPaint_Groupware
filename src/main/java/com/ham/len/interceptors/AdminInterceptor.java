package com.ham.len.interceptors;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.humanresource.RoleVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		   
	    HumanResourceVO humanResourceVO = (HumanResourceVO)authentication.getPrincipal();
		List<RoleVO> roles=humanResourceVO.getRoles();
		for(RoleVO roleVO: roles) {
	    	  if(roleVO.getRoleName().equals("ROLE_ADMIN")) {
	    		 return true;  
	    	  }
	      }
		
		request.setAttribute("message", "관리자 권한이 없습니다");
	    request.setAttribute("url", "/");
	    RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
	    view.forward(request, response);
		return false;
	
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("========== Post Controller 나가기 전 =======");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		log.info("========== JSP 렌더링 후 ==============");
		
	}
	
	
}
