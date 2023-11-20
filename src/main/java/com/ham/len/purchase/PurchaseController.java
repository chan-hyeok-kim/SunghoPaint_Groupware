package com.ham.len.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.admin.CodeService;
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;
import com.ham.len.factoryStorage.FactoryStorageService;
import com.ham.len.factoryStorage.FactoryStorageVO;
import com.ham.len.humanresource.HumanResourceService;
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
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {
		List<PurchaseVO> ar = purchaseService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		
		return "purchase/list";
	}

	@GetMapping("add") // 입력폼으로 이동시켜주는것
	public String add(Model model) throws Exception {
		List<SalesClientVO> cm = salesService.getClientList();
		model.addAttribute("client", cm);
		List<FactoryStorageVO> fs = purchaseService.getList2();
		model.addAttribute("factory", fs);
		List<MaterialProductVO> mm = purchaseService.getList3();
		model.addAttribute("material", mm);

		return "purchase/add";
	}

	@PostMapping("add")
	public String add(PurchaseVO purchaseVO, @AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
		
		purchaseVO.setEmployeeId(humanResourceVO.getEmployeeID());
		
		int result = purchaseService.setAdd(purchaseVO);

		return "redirect:./list";
	}

	@GetMapping("detail")
	public ModelAndView detail(PurchaseVO purchaseVO, ModelAndView mv) throws Exception {
	
		purchaseVO = purchaseService.getDetail(purchaseVO);
		mv.addObject("kvo", purchaseVO);
		mv.setViewName("purchase/detail");

		return mv;
	}

	@GetMapping("update")
	public void update(PurchaseVO purchaseVO, Model model) throws Exception {
		List<FactoryStorageVO> fs = purchaseService.getList2();
		model.addAttribute("factory", fs);
		List<MaterialProductVO> mm = purchaseService.getList3();
		model.addAttribute("material", mm);
		List<SalesClientVO> cm = salesService.getClientList();
		model.addAttribute("client", cm);
		log.info("여기에요 봐주세요 {}", cm);
		log.info("여기에요 봐주세요 {}", fs);
		log.info("여기에요 봐주세요 {}", mm);
		purchaseVO = purchaseService.getDetail(purchaseVO);
		model.addAttribute("kvo", purchaseVO);
	}

	@PostMapping("update") public String update(PurchaseVO purchaseVO, SalesClientVO
	 clientName,HumanResourceVO employeeId)throws Exception{
	  
	 purchaseVO.setSalesClientVO(clientName); 
	 purchaseVO.setHumanResourceVO(employeeId);
	 
	 
	 return "redirect:./update?purchaseNo=" + purchaseVO.getPurchaseNo();
	}
	 

	@PostMapping("delete")
	public String delete(@RequestParam(value = "deleteCdArr[]") List<Long> deleteCdArr,Model model) throws Exception {
		int result=0;
		if(deleteCdArr!=null) {
	    	for(Long d: deleteCdArr) {
	    		PurchaseVO purchaseVO = new PurchaseVO();
	    		purchaseVO.setPurchaseNo(d);
	    	    
	    	    result=purchaseService.setDelete(purchaseVO);
	    	    }
	    	}
	    	model.addAttribute("result", result);
	    	return "commons/ajaxResult";
	}

}
