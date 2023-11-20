package com.ham.len.humanresource;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HumanResourceController {
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("/forbidden")
	public String forbidden(Model model) {
		model.addAttribute("result", 0);
		model.addAttribute("message", "접근 권한이 없습니다.");
		model.addAttribute("url", "/");
		
		return "commons/result";
	}
	
	@GetMapping("/login")
	public String getLogin(@ModelAttribute HumanResourceVO humanResourceVO) {
		return "login";
	}
	
	@GetMapping("/humanresource/registration")
	public String setRegistration(@ModelAttribute HumanResourceVO humanResourceVO, Model model) {
		model.addAttribute("isRegistration", true);
		return "humanresource/registration";
	}
	
	@PostMapping("/humanresource/registration")
	public String setRegistration(@Valid HumanResourceVO humanResourceVO, BindingResult bindingResult, MultipartFile file, Model model) throws Exception {
		boolean hasErrors = humanResourceService.getRegistrationError(humanResourceVO, bindingResult);
		if(bindingResult.hasErrors() || hasErrors) {
			model.addAttribute("hasErrors", true);
			model.addAttribute("isRegistration", true);
			return "humanresource/registration";
		}
		
		humanResourceService.setRegistration(humanResourceVO, file);
		model.addAttribute("result", 1);
		model.addAttribute("message", "등록이 완료되었습니다.");
		model.addAttribute("url", "/humanresource/list");
		return "commons/result";
	}
	
	@GetMapping("/humanresource/list")
	public String getList(HumanResourcePager pager, Model model) {
		model.addAttribute("humanResourceList", humanResourceService.getHumanResourceList(pager));
		model.addAttribute("pager", pager);
		model.addAttribute("departmentList", humanResourceService.getDepartmentList());
		return "humanresource/list";
	}
	
	@GetMapping("/humanresource/list/excelDownload")
	public void excelDownload() {
		humanResourceService.excelDownload();
	}
	
	@GetMapping("/humanresource/detail")
	public String getDetail(@AuthenticationPrincipal HumanResourceVO humanResourceVO, Model model) {
		model.addAttribute("humanResourceVO", humanResourceService.getHumanResource(humanResourceVO.getEmployeeID()));
		model.addAttribute("isDetail", true);
		return "humanresource/registration";
	}
	
	@GetMapping("/humanresource/getAccountRole")
	@ResponseBody
	public List<String> getAccountRole(String employeeID) {
		return humanResourceService.getAccountRole(employeeID);
	}
	
	@PostMapping("/humanresource/setUpdateAccountRole")
	@ResponseBody
	public int setUpdateAccountRole(@RequestBody List<AccountRoleVO> accountRoles) {
		return humanResourceService.setUpdateAccountRole(accountRoles);
	}
	
	@GetMapping("/humanresource/update")
	public String setUpdate(String employeeID, Model model) {
		model.addAttribute("humanResourceVO", humanResourceService.getHumanResource(employeeID));
		model.addAttribute("isUpdate", true);
		return "humanresource/registration";
	}
	
	@PostMapping("/humanresource/update")
	public String setUpdate(@Valid HumanResourceVO humanResourceVO, BindingResult bindingResult, MultipartFile file, Model model) throws Exception {
		if(bindingResult.hasErrors()) {
			model.addAttribute("hasErrors", true);
			model.addAttribute("isUpdate", true);
			return "humanresource/registration";
		}
		
		humanResourceService.setUpdate(humanResourceVO, file);
		model.addAttribute("result", 1);
		model.addAttribute("message", "수정이 완료되었습니다.");
		model.addAttribute("url", "/humanresource/update?employeeID=" + humanResourceVO.getEmployeeID());
		return "commons/result";
	}
	
	/*
		@GetMapping("/humanresource/delete")
		public String setDelete(String employeeID) {
			humanResourceService.setDelete(employeeID);
			return "redirect:/humanresource/list";
		}
	*/
	
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
		}else {
			humanResourceVO.setPassword(updatePasswordVO.getNewPassword());
			int result = humanResourceService.setUpdatePassword(humanResourceVO);
			
			if(result > 0) {
				model.addAttribute("result", 1);
				model.addAttribute("message", "변경이 완료되었습니다.");
				model.addAttribute("url", "/logout");
			}else {
				model.addAttribute("result", 0);
				model.addAttribute("message", "비밀번호 변경 실패(서버 내부적 오류)");
				model.addAttribute("url", "/humanresource/updatePassword");
			}
		}
		
		return "commons/result";
	}
	
	@GetMapping("/humanresource/checkEmployeeID")
	@ResponseBody
	public String checkEmployeeID(String employeeID) {
		if(humanResourceService.getHumanResource(employeeID) != null)
			return employeeID;
		
		return null;
	}
	
	@GetMapping("/humanresource/findPw")
	@ResponseBody
	public String findPw(String employeeID) {
		return humanResourceService.findPw(employeeID);
	}
}