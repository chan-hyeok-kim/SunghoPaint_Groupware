package com.ham.len.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("code")
public class CodeController {

	@Autowired
	private CodeService codeService;

	@Autowired
	private MakeColumn makeColumn;
	
	private String id="2023001";
	
	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		log.warn("페이저체크{}",pager);
		List ar=codeService.getList(pager);
		model.addAttribute("list", ar);
		
	}
	
	
	@PostMapping("add")
    public String setAdd(CodeVO codeVO,Model model,HttpServletRequest request) throws Exception{
    	 
		String Upcode=codeVO.getUpCode().toUpperCase();
		codeVO.setUpCode(Upcode);
		
		String code=codeVO.getCode().toUpperCase();
		codeVO.setCode(code);
		//혹시 소문자 들어오면 대문자로 변환
		
		String path=request.getRequestURI();
		codeVO=makeColumn.getColumn(codeVO, path, id);
		int result=codeService.setAdd(codeVO);
    	 
    	 if(result>0) {
    		 model.addAttribute("message", "코드가 성공적으로 등록되었습니다.");
    	 }else {
    		 model.addAttribute("message", "에러. 코드 등록 실패");	
    	 }
    	 model.addAttribute("result", result);
    	 model.addAttribute("url", "/code/list");
    	 return "commons/result";
    }
	
	@PostMapping("update")
	public String setUpdate(CodeVO codeVO,HttpServletRequest request) throws Exception{
		
		 String path=request.getRequestURI();
		 log.warn("수정됐는지확인{}",codeVO);
 		 codeVO=makeColumn.getModColumn(codeVO, path, id);
		 int result=codeService.setUpdate(codeVO);
		 
		 log.warn("수정됐는지확인{}",codeVO);
		 log.warn("수정됐는지확인{}",result);
		 return "redirect:/code/list";
	}
	
	@PostMapping("delete")
	public String setDelete(@RequestParam(value = "deleteCdArr[]") List<String> deleteCdArr,Model model) throws Exception{
		int result=0;
		if(deleteCdArr!=null) {
	    	for(String d: deleteCdArr) {
	    	    CodeVO codeVO=new CodeVO();
	    	    codeVO.setCode(d);
	    	    
	    	    result=codeService.setDelete(codeVO);
	    	    }
	    	}
	    	model.addAttribute("result", result);
	    	return "commons/ajaxResult";
	}
	
	
	@PostMapping("codeCheck")
	public String getCodeCheck(CodeVO codeVO,Model model) throws Exception{
		Long result=codeService.getCodeCheck(codeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
}
