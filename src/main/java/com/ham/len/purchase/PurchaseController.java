package com.ham.len.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.VOs.ClientVO;
import com.ham.len.VOs.EmployeeVO;
import com.ham.len.VOs.FactoryStorageVO;
import com.ham.len.admin.CodeService;
import com.ham.len.commons.CodeVO;
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
		log.warn("=============={}==============", ar);
		log.warn("=============={}==============", model);
		model.addAttribute("list", ar);
		
		return "purchase/list";
	}
	
	@GetMapping("add") //입력폼으로 이동시켜주는것
	public String add()throws Exception{
		
		return "purchase/add";
	}
	
	@PostMapping("add")
	public String add(PurchaseVO purchaseVO)throws Exception{
		
		return "redirect:./list";
	}
	
	@GetMapping("detail")
	public ModelAndView detail(PurchaseVO purchaseVO, ModelAndView mv)throws Exception{
		
		purchaseVO = purchaseService.getDetail(purchaseVO);
		mv.addObject("kvo", purchaseVO);
		mv.setViewName("purchase/detail");
		
		return mv;
	}
	
	@GetMapping("update")
	public void update(PurchaseVO purchaseVO, Model mv)throws Exception{
		purchaseVO = purchaseService.getDetail(purchaseVO);
		mv.addAttribute("kvo", purchaseVO);		
		
		
	}
	
	@PostMapping("update")
	public String update(PurchaseVO purchaseVO, ClientVO clientName,EmployeeVO employeeId)throws Exception{
		
		purchaseVO.setClientVO(clientName);
		purchaseVO.setEmployeeVO(employeeId);
		
		log.warn("*********purchaseVO : {}***********", purchaseVO);
		
		int result = purchaseService.setUpdate(purchaseVO);
		
		log.warn("========== result : {}==========", result);
		
//		return "redirect:./update?purchaseNo=" + purchaseVO.getPurchaseNo();
		return "redirect:./list";
	}
	
	@PostMapping("delete")
	public String delete(PurchaseVO purchaseNo)throws Exception{
		int result = purchaseService.setDelete(purchaseNo);
		log.warn("++++++++++++++ pruchaseNo : {}++++++++++++++++", result);
		
		return "redirect:./list";
	}
	 
}


