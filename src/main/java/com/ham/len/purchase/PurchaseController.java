package com.ham.len.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.sym.Name;
import com.ham.len.VOs.ClientVO;
import com.ham.len.VOs.FactoryStorageVO;
import com.ham.len.VOs.MaterialProductVO;
import com.ham.len.admin.CodeService;
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

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
	public String add(PurchaseVO purchaseVO, String fcode)throws Exception{
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeName(fcode);
		System.out.println(purchaseVO);
		System.out.println(fcode);
		FactoryStorageVO factoryStorageVO = purchaseService.factorySearch(codeVO);
//		공장VO형의 공장변수 = 구매서비스에 공장검색메소드(코드VO)
		purchaseVO.setFactoryStorageNo(factoryStorageVO.getFactoryStorageNo());
//		구매VO에 넣는공장번호(공장VO에 꺼낸공장번호)

//		제품번호 검색기능
		MaterialProductVO materialProductVO = purchaseService.productSearch(codeVO);
		purchaseVO.setMaterialProductNo(materialProductVO.getMaterialProductNo());
		
//		담당자 검색기능
		HumanResourceVO humanResourceVO = purchaseService.humanSearch(codeVO);
		purchaseVO.setEmployeeID(humanResourceVO.getEmployeeID());
		
//		거래처 검색기능
		ClientVO clientVO = purchaseService.clientSearch(codeVO);
		purchaseVO.setClientNo(clientVO.getClientNo());
		
		int result=purchaseService.setAdd(purchaseVO);
		
		log.warn("=-=-=-=-=-=-=-=-=-=result : {}=-=-=-=-=-=-=-=-=-=-=-=", result);
//		결과값 = 구매서비스에 넣은더하기값(구매VO)
		
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
	public String update(PurchaseVO purchaseVO, ClientVO clientName,HumanResourceVO name)throws Exception{
		
		purchaseVO.setClientVO(clientName);
		purchaseVO.setHumanResourceVO(name);
		
		log.warn("*********purchaseVO : {}***********", purchaseVO);
		
		int result = purchaseService.setUpdate(purchaseVO);
		
		log.warn("========== result : {}==========", result);
		
//		return "redirect:./update?purchaseNo=" + purchaseVO.getPurchaseNo();
		return "redirect:./list";
	}
	
	@PostMapping("delete")
	public String delete(@RequestParam(value = "purchaseNo[]", required = false) List<Long> purchaseNo)throws Exception{
		
		if(purchaseNo!=null) {
			for(Long p : purchaseNo) {
				PurchaseVO purchaseVO = new PurchaseVO();
				purchaseVO.setPurchaseNo(p);
		
				int result = purchaseService.setDelete(purchaseVO);
			}
		}
		
		return "commons/ajaxResult";
	}
	 
}