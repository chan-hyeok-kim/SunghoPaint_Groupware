package com.ham.len.instrument;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/instrument/*")
public class InstrumentController {

	@Autowired
	private InstrumentService instrumentService;
	
	@Autowired
	private MakeColumn makeColumn;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<InstrumentVO> ar = instrumentService.getList(pager);	
		log.warn("========{}========",ar);
		log.warn("========{}========",pager);
		model.addAttribute("list", ar);
	 	model.addAttribute("pager", pager);
		 
		return "instrument/list";
	}
	
	
	@PostMapping(value = "add")
	public String setAdd(InstrumentVO instrumentVO, HttpServletRequest request, Model model)throws Exception{
	
		String id = "2023002";
		String path=request.getRequestURI();
		//나중에 세션에서 조회
		instrumentVO.setEmployeeId(id);
		instrumentVO = (InstrumentVO)makeColumn.getColumn(instrumentVO, path, id);
		log.warn("====================================기기입력 체크{}",instrumentVO);
		int result=instrumentService.setAdd(instrumentVO);

	   	 if(result>0) {
			 model.addAttribute("message", "코드가 정상 등록되었습니다.");
		 }else {
			 model.addAttribute("message", "코드 등록 실패");	
		 }
    	model.addAttribute("result", result);
    	model.addAttribute("url", "/instrument/list");
    	return "commons/result";
    			
	}
	
	@RequestMapping(value = "detail")
	public ModelAndView getDetail(InstrumentVO instrumentVO, ModelAndView mv) throws Exception{
		instrumentVO = instrumentService.getDetail(instrumentVO);
		mv.addObject("dto", instrumentVO);
		mv.setViewName("instrument/detail");
		return mv;
	}   
	
	//form으로 이동
	@GetMapping(value = "update")
	public void setUpdate(InstrumentVO instrumentVO, Model model) throws Exception {
		instrumentVO = instrumentService.getDetail(instrumentVO);
		model.addAttribute("dto", instrumentVO);
	}
	
	@PostMapping(value = "update")
	public String setUpdate(InstrumentVO instrumentVO, HttpServletRequest request) throws Exception {
		String id = "2023002";
		String path=request.getRequestURI();
		instrumentVO=(InstrumentVO)makeColumn.getModColumn(instrumentVO, path, id);
		instrumentService.setUpdate(instrumentVO);
		return "redirect:/instrument/list";
		

	}
	
	@PostMapping(value = "delete")
	public String setDelete(@RequestParam(value = "deleteCdArr[]") List<String> deleteCdArr,Model model) throws Exception {
		int result=0;
		if(deleteCdArr!=null) {
	    	for(String d: deleteCdArr) {
	    	    InstrumentVO instrumentVO = new InstrumentVO();
	    	    instrumentVO.setInstrumentCd(d);
	    	    
	    	    result = instrumentService.setDelete(instrumentVO);
	    	    }
	    	}
	    	model.addAttribute("result", result);
	    	return "commons/ajaxResult";
	}
	
	@PostMapping("instrumentCheck")
	public String getInstrumentCheck(InstrumentVO instrumentVO, Model model) throws Exception{
		Long result=instrumentService.getInstrumentCheck(instrumentVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
}
