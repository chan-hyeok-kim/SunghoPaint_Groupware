package com.ham.len.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	
	@GetMapping("home")
	public void getHome() throws Exception{
		
	}
	
	@GetMapping("getSalesTeamList")
	@ResponseBody
	public List<EmployeeVO> getSalesTeamList(EmployeeVO employeeVO) throws Exception{
		return approvalService.getSalesTeamList(employeeVO);
	}
}
