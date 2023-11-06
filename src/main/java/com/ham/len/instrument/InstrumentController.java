package com.ham.len.instrument;

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

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/instrument/*")
public class InstrumentController {

	@Autowired
	private InstrumentService instrumentService;
	
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
	public String setAdd(InstrumentVO instrumentVO, HttpSession session, Model model)throws Exception{
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		instrumentVO.setEmployeeId(memberDTO.getId());
		int result = instrumentService.setAdd(instrumentVO);
				
		model.addAttribute("result", result);
		return "commons/ajaxResult";	
		
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
	public String setUpdate(InstrumentVO instrumentVO) throws Exception {
		instrumentService.setUpdate(instrumentVO);
		return "redirect:./detail?instrumentCd=" + instrumentVO.getInstrumentCd();
	}
	
	@PostMapping(value = "delete")
	public String setDelete(InstrumentVO instrumentVO) throws Exception {
		instrumentService.setDelete(instrumentVO);
		return "redirect:./list";
	}
	

	
}
