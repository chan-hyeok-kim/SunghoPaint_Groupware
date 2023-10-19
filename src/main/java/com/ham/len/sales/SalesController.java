package com.ham.len.sales;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sales/*")
public class SalesController {

	
	@GetMapping("list")
	public String getList() throws Exception{
		 
		 return "sales/list";
	}
}
