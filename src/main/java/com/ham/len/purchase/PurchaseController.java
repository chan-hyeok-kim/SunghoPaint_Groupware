package com.ham.len.purchase;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceDAO;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.materialProduct.MaterialProductService;
import com.ham.len.materialProduct.MaterialProductVO;
import com.ham.len.sales.SalesClientVO;
import com.ham.len.sales.SalesService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private MaterialProductService materialProductService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model)throws Exception{
		List<PurchaseVO> ar = purchaseService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		log.warn("여기에요 확인좀여 PurchaseVO : {}+-+-+-+-+-+-+", ar);
		
		return "purchase/list";
	}
	
	@GetMapping("add") //입력폼으로 이동시켜주는것
	public String add(Model model)throws Exception{
		List<SalesClientVO> arr = salesService.getClientList();		
		model.addAttribute("client", arr);	
		List<MaterialProductVO> arrr = materialProductService.getList2();
		model.addAttribute("material", arrr);
		log.warn("여기에요 확인좀여 MaterialProductVO : {}+-+-+-+-+-+-+", arrr);
		
		
		return "purchase/add";
	}
	
	@PostMapping("add")
	public String add(PurchaseVO purchaseVO, HttpSession httpSession, Model model)throws Exception{

		int result = purchaseService.setAdd(purchaseVO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
//		return "redirect:./list";
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
	
	/*
	 * @PostMapping("update") public String update(PurchaseVO purchaseVO, ClientVO
	 * clientName,EmployeeVO employeeId)throws Exception{
	 * 
	 * purchaseVO.setClientVO(clientName); purchaseVO.setEmployeeVO(employeeId);
	 * 
	 * log.warn("*********purchaseVO : {}***********", purchaseVO);
	 * 
	 * int result = purchaseService.setUpdate(purchaseVO);
	 * 
	 * log.warn("========== result : {}==========", result);
	 * 
	 * // return "redirect:./update?purchaseNo=" + purchaseVO.getPurchaseNo();
	 * return "redirect:./list"; }
	 */
	
	@PostMapping("delete")
	public String delete(PurchaseVO purchaseNo)throws Exception{
		int result = purchaseService.setDelete(purchaseNo);
		log.warn("++++++++++++++ pruchaseNo : {}++++++++++++++++", result);
		
		return "redirect:./list";
	}
	 
}


