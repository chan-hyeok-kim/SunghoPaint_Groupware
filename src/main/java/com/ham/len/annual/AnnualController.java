package com.ham.len.annual;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.humanresource.HumanResourceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/annual/*")
public class AnnualController {
	@Autowired
	private AnnualService annualService;
	
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("status")
	public String getStatus(HumanResourcePager pager, Model model) {
		model.addAttribute("annualList", annualService.getAnnualList(pager));
		model.addAttribute("departmentList", humanResourceService.getDepartmentList());
		model.addAttribute("pager", pager);
		return "annual/status";
	}
	
	@GetMapping("status/excelDownload")
	public void excelDownload() {
		annualService.excelDownload();
	}
}