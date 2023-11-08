package com.ham.len.humanresource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String setRegistration(@ModelAttribute HumanResourceVO humanResourceVO) {
		return "humanresource/registration";
	}
	
	@PostMapping("/humanresource/registration")
	public String setRegistration(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceService.setRegistration(humanResourceVO, file);
		return "humanresource/registration";
	}
	
	@GetMapping("/humanresource/list")
	public String getView(HumanResourcePager pager, Model model) {
		model.addAttribute("humanResourceList", humanResourceService.getHumanResourceList(pager));
		model.addAttribute("pager", pager);
		model.addAttribute("departmentList", humanResourceService.getDepartmentList());
		return "humanresource/list";
	}
	
	@GetMapping("/humanresource/update")
	public String getDetail(String employeeID, Model model) {
		HumanResourceVO humanResourceVO = humanResourceService.getHumanResource("2023015");
		log.info("========== {} ==========", humanResourceVO);
		model.addAttribute("humanResourceVO", humanResourceVO);
		// model.addAttribute("humanResourceVO", humanResourceService.getHumanResource(employeeID));
		return "humanresource/registration"; 
	}
}