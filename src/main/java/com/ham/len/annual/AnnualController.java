package com.ham.len.annual;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/annual/*")
public class AnnualController {
	@GetMapping("status")
	public String getStatus() {
		return "annual/status";
	}
}