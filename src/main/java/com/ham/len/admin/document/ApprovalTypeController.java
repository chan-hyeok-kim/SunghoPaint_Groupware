package com.ham.len.admin.document;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.admin.CodeService;
import com.ham.len.admin.CodeVO;
import com.ham.len.approval.ApprovalService;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/document/*")
public class ApprovalTypeController {

	@Autowired
	private ApprovalTypeService approvalTypeService;
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("list")
	public void getList(Pager pager) throws Exception{
		
	}
	
	@GetMapping("add")
	public void setAdd(HttpServletRequest request) throws Exception{
		
	}
	
	@PostMapping("add")
	public void setAdd(ApprovalTypeVO approvalTypeVO,CodeVO codeVO, HttpServletRequest request) throws Exception{
		approvalTypeVO.setEmployeeId("2023001");
		String path=request.getRequestURI();
		log.warn("====={}======",path);
		approvalTypeVO.setRegMenu(path+".jsp");
		approvalTypeVO.setModMenu(path+".jsp");
	    approvalTypeVO.setRegId("2023001");
	    approvalTypeVO.setModId("2023001");
		
	    String code=approvalTypeVO.getApprovalTypeCd();
	    codeVO.setCode(code);
	    codeVO.setUpCode(code.substring(0,3));
	    codeVO.setRegMenu(path+".jsp");
	    codeVO.setModMenu(path+".jsp");
	    codeVO.setRegId("2023001");
	    codeVO.setModId("2023001");
	    log.warn("====={}==={}===",codeVO,approvalTypeVO);
	    
	    codeService.setAdd(codeVO);
		approvalTypeService.setAdd(approvalTypeVO);
	}
}
