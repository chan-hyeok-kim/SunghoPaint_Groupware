package com.ham.len.admin.document;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.admin.CodeService;
import com.ham.len.admin.CodeVO;
import com.ham.len.approval.ApprovalService;
import com.ham.len.commons.MakeColumn;
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
	
	@Autowired
	private MakeColumn makeColumn;
	
	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		
	}
	
	@GetMapping("add")
	public void setAdd(HttpServletRequest request) throws Exception{
		
	}
	
	@PostMapping("add")
	public void setAdd(ApprovalTypeVO approvalTypeVO,CodeVO codeVO, HttpServletRequest request) throws Exception{
		String id="2023001";
		
		approvalTypeVO.setEmployeeId(id);
		String path=request.getRequestURI();
		log.warn("====={}======",path);
		approvalTypeVO=(ApprovalTypeVO)makeColumn.getColumn(approvalTypeVO, path, id);
		
		
	    String code=approvalTypeVO.getApprovalTypeCd();
	    codeVO.setCode(code);
	    codeVO.setUpCode(code.substring(0,3));
	    
	    codeVO=(CodeVO)makeColumn.getColumn(codeVO, path, id);
	    
	    log.warn("====={}==={}===",codeVO,approvalTypeVO);
	    
	    codeService.setAdd(codeVO);
		int result=approvalTypeService.setAdd(approvalTypeVO);
	}
	
	@PostMapping("setImg")
	public void setImg(MultipartFile[] files) throws Exception{
		
	}
	
	@GetMapping("ajaxList")
	@ResponseBody
	public List<ApprovalTypeVO> getAjaxList(Pager pager) throws Exception{
		List<ApprovalTypeVO> ar=approvalTypeService.getList(pager);
		return ar;
	}
	
	
}
