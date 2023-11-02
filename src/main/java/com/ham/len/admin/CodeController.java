package com.ham.len.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("code")
public class CodeController {

	@Autowired
	private CodeService codeService;

	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		List ar=codeService.getList(pager);
		model.addAttribute("list", ar);
		
	}
	
	@GetMapping("add")
	public void setAdd() throws Exception{
		
	}
	
	@PostMapping("add")
    public void setAdd(CodeVO codeVO) throws Exception{
    	 int result=codeService.setAdd(codeVO);
    }
	
	@GetMapping("update")
	public void setUpdate() throws Exception{
		
	}
	
	@PostMapping("update")
	public void setUpdate(CodeVO codeVO) throws Exception{
		 int result=codeService.setUpdate(codeVO);
	}
	
	@PostMapping("delete")
	public void setDelete(CodeVO codeVO) throws Exception{
		int result=codeService.setDelete(codeVO);
	}
	
	
	
}
