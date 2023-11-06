package com.ham.len.materialProduct;

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
@RequestMapping("/material/*")
public class MaterialProductController {

	@Autowired
	private MaterialProductService materialService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<MaterialProductVO> ar = materialService.getList(pager);	
		model.addAttribute("list", ar);
	 	model.addAttribute("pager", pager);
		 
		return "material/list";
	}
	
	
	@PostMapping(value = "add")
	public String setAdd(MaterialProductVO materialVO, HttpSession session, Model model)throws Exception{
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		instrumentVO.setEmployeeId(memberDTO.getId());
		int result = materialService.setAdd(materialVO);
				
		model.addAttribute("result", result);
		return "commons/ajaxResult";	
		
	}
	
	@RequestMapping(value = "detail")
	public ModelAndView getDetail(MaterialProductVO materialVO, ModelAndView mv) throws Exception{
		materialVO = materialService.getDetail(materialVO);
		mv.addObject("dto", materialVO);
		mv.setViewName("material/detail");
		return mv;
	}   
	
	//form으로 이동
	@GetMapping(value = "update")
	public void setUpdate(MaterialProductVO materialVO, Model model) throws Exception {
		materialVO = materialService.getDetail(materialVO);
		model.addAttribute("dto", materialVO);
	}
	
	@PostMapping(value = "update")
	public String setUpdate(MaterialProductVO materialVO) throws Exception {
		materialService.setUpdate(materialVO);
		return "redirect:./detail?materialProductCd=" + materialVO.getMaterialProductCd();
	}
	
	@PostMapping(value = "delete")
	public String setDelete(MaterialProductVO materialVO) throws Exception {
		materialService.setDelete(materialVO);
		return "redirect:./list";
	}
}
