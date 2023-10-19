package com.ham.len.humanresource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/humanResource/*")
public class HumanResourceController {
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("login")
	public String getLogin(@ModelAttribute HumanResourceVO humanResourceVO) {
		return "humanResource/login";
	}	
}