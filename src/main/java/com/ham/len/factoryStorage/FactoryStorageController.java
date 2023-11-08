package com.ham.len.factoryStorage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;
import com.ham.len.instrument.InstrumentVO;

@Controller
@RequestMapping("/factory/*")
public class FactoryStorageController {

	@Autowired
	private FactoryStorageService factoryStorageService;
	
	@Autowired
	private MakeColumn makeColumn;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<FactoryStorageVO> ar = factoryStorageService.getList(pager);	
		model.addAttribute("list", ar);
	 	model.addAttribute("pager", pager);
		 
		return "factory/list";
	}
	
	
	@PostMapping(value = "add")
	public String setAdd(FactoryStorageVO factoryStorageVO, HttpServletRequest request, Model model)throws Exception{
		String id = "2023001";
		String path=request.getRequestURI();
		//나중에 세션에서 조회
		factoryStorageVO.setEmployeeId(id);
		factoryStorageVO = (FactoryStorageVO)makeColumn.getColumn(factoryStorageVO, path, id);
		int result=factoryStorageService.setAdd(factoryStorageVO);

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
		String id = "2023001";
		String path=request.getRequestURI();
		factoryStorageVO=(FactoryStorageVO)makeColumn.getModColumn(factoryStorageVO, path, id);
		factoryStorageService.setUpdate(factoryStorageVO);
		return "redirect:/factory/list";
		

	}
	
	@PostMapping(value = "delete")
	public String setDelete(FactoryStorageVO factoryStorageVO) throws Exception {
		factoryStorageService.setDelete(factoryStorageVO);
		return "redirect:./list";
	}
}
