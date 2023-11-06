package com.ham.len.factoryStorage;

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
	public String setAdd(FactoryStorageVO factoryStorageVO, HttpSession session, Model model)throws Exception{
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		instrumentVO.setEmployeeId(memberDTO.getId());
		int result = factoryStorageService.setAdd(factoryStorageVO);
				
		model.addAttribute("result", result);
		return "commons/ajaxResult";	
		
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
	public String setUpdate(FactoryStorageVO factoryStorageVO) throws Exception {
		factoryStorageService.setUpdate(factoryStorageVO);
		return "redirect:./detail?factoryStorageCd=" + factoryStorageVO.getFactoryStorageCd();
	}
	
	@PostMapping(value = "delete")
	public String setDelete(FactoryStorageVO factoryStorageVO) throws Exception {
		factoryStorageService.setDelete(factoryStorageVO);
		return "redirect:./list";
	}
}
