package com.ham.len.commons;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonsVO {
	private String regId;
	private Date regDate;
	private String regMenu;
	private String modId;
	private Date modDate;
	private String modMenu;
	
	public CommonsVO() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = null;
		if(authentication != null) id = authentication.getName(); // NullPointerException 방지(로그인 시에는 Authentication이 존재하지 않음)
		
		Date date = new Date();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String uri = request.getHeader("Referer");
		String menu = "";
		if(uri != null) menu = uri.substring(uri.lastIndexOf("/") + 1) + ".jsp";
		
		this.regId = id;
		this.regDate = date;
		this.regMenu = menu;
		this.modId = id;
		this.modDate = date;
		this.modMenu = menu;		
	}
}