package com.ham.len.approval;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		 List<ApprovalVO> ar = approvalService.getList(pager);
		 log.warn("========{}========",ar);
		 model.addAttribute("list", ar);
		 return "approval/list";
	}
}
