package com.ham.len.humanresource;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		return "redirect:/humanresource/list";
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
		model.addAttribute("humanResourceVO", humanResourceService.getHumanResource(employeeID));
		return "humanresource/registration";
	}
	
	@PostMapping("/humanresource/update")
	public String getDetail(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceService.setUpdate(humanResourceVO, file);
		return "redirect:/humanresource/update?employeeID=" + humanResourceVO.getEmployeeID();
	}
	
	@GetMapping("/humanresource/delete")
	public String setDelete(String employeeID) {
		humanResourceService.setDelete(employeeID);
		return "redirect:/humanresource/list";
	}
	
	@GetMapping("/humanresource/updatePassword")
	public String setUpdatePassword(@ModelAttribute UpdatePasswordVO updatePasswordVO) {
		return "humanresource/updatePassword";
	}
	
	@PostMapping("/humanresource/updatePassword")
	public String setUpdatePassword(@Valid UpdatePasswordVO updatePasswordVO, BindingResult bindingResult, @AuthenticationPrincipal HumanResourceVO humanResourceVO, Model model) {
		model.addAttribute("updatePasswordVO", updatePasswordVO);
		
		boolean hasErrors = humanResourceService.getUpdatePasswordError(updatePasswordVO, bindingResult, humanResourceVO);
		if(bindingResult.hasErrors() || hasErrors) {
			return "humanresource/updatePassword";
		}
		
		return "redirect:/";
	}
}