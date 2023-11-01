package com.ham.len.approval;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.len.admin.document.ApprovalTypeService;
import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.admin.document.ApprovalUpTypeVO;
import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.humanresource.sign.SignatureService;
import com.nimbusds.jose.JWSObjectJSON.Signature;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private ApprovalTypeService approvalTypeService;
	
	@Autowired
	private SignatureService signatureService;
	
	@Autowired
	private MakeColumn makeColumn;
	
	private String id="2023001";
	
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		 List<ApprovalVO> ar = approvalService.getList(pager);		                    
		 log.warn("========{}========",ar);
		 
		 
		 model.addAttribute("list", ar);
		 
		 
		 return "approval/list";
	}
	
	@GetMapping("listEx")
	public String getListEx(Pager pager,Model model) throws Exception{
		 List<ApprovalVO> ar = approvalService.getList(pager);
		 log.warn("========{}========",ar);
		 model.addAttribute("list", ar);
		 return "approval/listEx";
	}
	
	@GetMapping("totalList")
	public void getTotalList(Pager pager,Model model) throws Exception{
		 List<ApprovalVO> ar = approvalService.getList(pager);
		 log.warn("========{}========",ar);
		 model.addAttribute("list", ar);
		
	}
	
	@GetMapping("add")
	public void setAdd(Model model,Pager pager) throws Exception{
		List<ApprovalTypeVO> total=approvalTypeService.getTotalList(pager);
	    
		model.addAttribute("list", total);
		
	}
	
	@PostMapping("add")
	public String setAdd(ApprovalVO approvalVO, HttpServletRequest request) throws Exception{
		
		String path=request.getRequestURI();
		approvalVO=(ApprovalVO)makeColumn.getColumn(approvalVO, path, id);
		
		//나머지 값 세팅
		approvalVO.setEmployeeId(id);
		approvalVO.setDrafter("최지우");
	
		int result=approvalService.setAdd(approvalVO);
		
	    
		return "redirect:/approval/list";
	}
	
	@ResponseBody
	@PostMapping("ajaxTeamList")
    public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception{
		List<HumanResourceVO> hr=approvalService.getTeamList(humanResourceVO);
		
		return hr;
    }
	
	@GetMapping("detail")
	public void getDetail(ApprovalVO approvalVO,Model model) throws Exception{
		approvalVO=approvalService.getDetail(approvalVO);
		model.addAttribute("vo", approvalVO);
	
	}
	
	
}
