package com.ham.len.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model)throws Exception{
		List<PurchaseVO> ar = purchaseService.getList(pager);
		log.warn("========{}=========", ar);
		model.addAttribute("list", ar);
		return "purchase/list";
	}
	
	@GetMapping("add")
	public String add()throws Exception{
		
		return "purchase/add";
	}
	
	@PostMapping("add")
	public String add(PurchaseVO purchaseVO)throws Exception{
		
		return "redirect:./";
	}
}
