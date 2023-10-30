package com.ham.len.transfer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/transfer/*")
public class TransferController {
	@Autowired
	private TransferService transferService;
	
	@GetMapping("/") // 또는 @GetMapping("")
	public String transfer(Model model) {
		model.addAttribute("isTransferForm", true);
		return "transfer/form";
	}
}