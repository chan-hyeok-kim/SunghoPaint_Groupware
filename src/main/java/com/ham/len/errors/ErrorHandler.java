package com.ham.len.errors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ErrorHandler implements org.springframework.boot.web.servlet.error.ErrorController {

//	@RequestMapping("/error")
//	public String notFound() throws Exception{
//		log.warn("에러먹는지확인");
//		return "errors/notFound";
//	}
	
    
}

    
    
    


