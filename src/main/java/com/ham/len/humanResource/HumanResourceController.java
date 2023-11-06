package com.ham.len.humanresource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;



import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HumanResourceController {
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("/login")
	public String getLogin(@ModelAttribute HumanResourceVO humanResourceVO) {
		
		return "login";
	}
	
	@GetMapping("/humanresource/registration")
	public String setRegistration() {
		return "humanresource/registration";
	}
	
	@PostMapping("/humanresource/registration")
	public String setRegistration(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceService.setRegistration(humanResourceVO, file);
		return "humanresource/registration";
	}
}