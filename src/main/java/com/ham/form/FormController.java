package com.ham.form;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FormController {
	
	@GetMapping("list")
	public String getIndex()throws Exception{
		
		return "formjsp";
	}

}
