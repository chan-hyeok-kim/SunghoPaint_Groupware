package com.ham.len.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {

	@GetMapping("/")
	public String getIndex()throws Exception{
		
		return "index";
	}
}
