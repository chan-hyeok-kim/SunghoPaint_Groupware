package com.ham.len.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {

	@GetMapping("/")
	public String getIndex(HttpServletRequest request)throws Exception{
		
		String path = request.getRequestURI();
		request.getRequestURI();
		
		log.warn("============{}==============",path);
		
		return "index";
	}
	
	
}
