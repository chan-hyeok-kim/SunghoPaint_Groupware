package com.ham.len.admin.document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.approval.ApprovalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/approvalType/*")
public class ApprovalTypeController {

	@Autowired
	private ApprovalTypeService approvalTypeService;
	
	@GetMapping("add")
	public void setAdd(ApprovalTypeVO approvalTypeVO) throws Exception{
		approvalTypeService.setAdd(approvalTypeVO);
	}
}
