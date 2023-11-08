package com.ham.len.materialProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/material/*")
public class MaterialProductController {

	@Autowired
	private MaterialProductService materialService;
	
	@Autowired
	private MakeColumn makeColumn;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<MaterialProductVO> ar = materialService.getList(pager);	
		model.addAttribute("list", ar);
	 	model.addAttribute("pager", pager);
		 
		return "material/list";
	}
	
	
	@PostMapping(value = "add")
	public String setAdd(MaterialProductVO materialVO, HttpServletRequest request, Model model)throws Exception{
		
		String id = "2023002";
		
		String path=request.getRequestURI();
		//나중에 세션에서 조회
		materialVO.setEmployeeId(id);
		materialVO = (MaterialProductVO)makeColumn.getColumn(materialVO, path, id);
		log.warn("====================================제품, 원료 체크{}",materialVO);
		int result=materialService.setAdd(materialVO);

    	model.addAttribute("result", result);
    	model.addAttribute("url", "/material/list");
    	return "commons/result";
    			
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
	public String setUpdate(MaterialProductVO materialVO, HttpServletRequest request) throws Exception {
		String id = "2023002";
		String path=request.getRequestURI();
		materialVO=(MaterialProductVO)makeColumn.getModColumn(materialVO, path, id);
		materialService.setUpdate(materialVO);
		return "redirect:/material/list";
	}
	
	@PostMapping(value = "delete")
	public String setDelete(@RequestParam(value = "deleteCdArr[]") List<String> deleteCdArr,Model model) throws Exception {
		int result=0;
		if(deleteCdArr!=null) {
	    	for(String d: deleteCdArr) {
	    		MaterialProductVO materialVO = new MaterialProductVO();
	    		materialVO.setMaterialProductCd(d);
	    	    
	    	    result = materialService.setDelete(materialVO);
	    	    }
	    	}
	    	model.addAttribute("result", result);
	    	return "commons/ajaxResult";
	}
}
