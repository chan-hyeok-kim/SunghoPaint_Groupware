package com.ham.len.factoryStorage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

@Controller
@RequestMapping("/factory/*")
public class FactoryStorageController {

	@Autowired
	private FactoryStorageService factoryStorageService;
	

	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<FactoryStorageVO> ar = factoryStorageService.getList(pager);	
		model.addAttribute("list", ar);
	 	model.addAttribute("pager", pager);
		 
		return "factory/list";
	}
	
	
	@PostMapping(value = "add")
	public String setAdd(FactoryStorageVO factoryStorageVO, HttpServletRequest request, Model model)throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		String path=request.getRequestURI();
		//나중에 세션에서 조회
		factoryStorageVO.setEmployeeId(id);
	
		int result=factoryStorageService.setAdd(factoryStorageVO);
		if(result>0) {
			 model.addAttribute("message", "코드가 정상 등록되었습니다.");
		 }else {
			 model.addAttribute("message", "코드 등록 실패");	
		 }
    	model.addAttribute("result", result);
    	model.addAttribute("url", "/factory/list");
    	return "commons/result";
    			
	}
	
	@RequestMapping(value = "detail")
	public ModelAndView getDetail(FactoryStorageVO factoryStorageVO, ModelAndView mv) throws Exception{
		factoryStorageVO = factoryStorageService.getDetail(factoryStorageVO);
		mv.addObject("dto", factoryStorageVO);
		mv.setViewName("factory/detail");
		return mv;
	}   
	
	//form으로 이동
	@GetMapping(value = "update")
	public void setUpdate(FactoryStorageVO factoryStorageVO, Model model) throws Exception {
		factoryStorageVO = factoryStorageService.getDetail(factoryStorageVO);
		model.addAttribute("dto", factoryStorageVO);
	}
	
	@PostMapping(value = "update")
	public String setUpdate(FactoryStorageVO factoryStorageVO, HttpServletRequest request) throws Exception {
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		String path=request.getRequestURI();
		factoryStorageService.setUpdate(factoryStorageVO);
		return "redirect:/factory/list";
		

	}
	
	@PostMapping(value = "delete")
	public String setDelete(@RequestParam(value = "deleteCdArr[]") List<String> deleteCdArr,Model model) throws Exception {
		int result=0;
		if(deleteCdArr!=null) {
	    	for(String d: deleteCdArr) {
	    		FactoryStorageVO factoryStorageVO = new FactoryStorageVO();
	    		factoryStorageVO.setFactoryStorageCd(d);
	    	    
	    	    result = factoryStorageService.setDelete(factoryStorageVO);
	    	    }
	    	}
	    	model.addAttribute("result", result);
	    	return "commons/ajaxResult";
	}
	
	@PostMapping("factoryCheck")
	public String getFactoryCheck(FactoryStorageVO factoryStorageVO, Model model) throws Exception{
		Long result=factoryStorageService.getFactoryCheck(factoryStorageVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
}
