package com.ham.len.approval;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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

import lombok.extern.java.Log;
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

	private String id = "2023001";

	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getList(pager);
		model.addAttribute("list", ar);

		log.warn("========{}========", ar);

		return "approval/list";
	}

	@GetMapping("ajaxList")
	public String getStatusList(ApprovalVO approvalVO,Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getStatusList(approvalVO,pager);
		model.addAttribute("list", ar);

		log.warn("========{}========", ar);

		return "approval/ajaxList";
	}

	@GetMapping("totalList")
	public void getTotalList(Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getList(pager);
		model.addAttribute("list", ar);

		log.warn("========{}========", ar);

	}

	@GetMapping("add")
	public void setAdd(Model model, Pager pager) throws Exception {
		List<ApprovalTypeVO> total = approvalTypeService.getTotalList(pager);
		model.addAttribute("list", total);

		// 사인 값 들고오기
		SecurityContext context = SecurityContextHolder.getContext();
		if (!(context.getAuthentication().getPrincipal() instanceof String)) {
			HumanResourceVO humanResourceVO = (HumanResourceVO) context.getAuthentication().getPrincipal();

			humanResourceVO = signatureService.getDetail(humanResourceVO);
			model.addAttribute("sign", humanResourceVO.getSignature());
		}

	}

	@PostMapping("add")
	public String setAdd(ApprovalVO approvalVO, HttpServletRequest request) throws Exception {

		String path = request.getRequestURI();
		approvalVO = (ApprovalVO) makeColumn.getColumn(approvalVO, path, id);

		// 나머지 값 세팅
		approvalVO.setEmployeeID(id);
		approvalVO.setDrafter("최지우");

		int result = approvalService.setAdd(approvalVO);

		return "redirect:/approval/list";
	}

	@ResponseBody
	@PostMapping("ajaxTeamList")
	public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception {
		List<HumanResourceVO> hr = approvalService.getTeamList(humanResourceVO);

		return hr;
	}

	@GetMapping("detail")
	public void getDetail(ApprovalVO approvalVO, Model model) throws Exception {
		approvalVO = approvalService.getDetail(approvalVO);
		model.addAttribute("vo", approvalVO);

		// 사인 값 들고오기
		SecurityContext context = SecurityContextHolder.getContext();
		if (!(context.getAuthentication().getPrincipal() instanceof String)) {
			HumanResourceVO humanResourceVO = (HumanResourceVO) context.getAuthentication().getPrincipal();

			humanResourceVO = signatureService.getDetail(humanResourceVO);
			model.addAttribute("sign", humanResourceVO.getSignature());
		}

	}

	@PostMapping("delete")
	public String setDelete(ApprovalVO approvalVO, Model model) throws Exception {
		int result = approvalService.setDelete(approvalVO);
		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}

	@GetMapping("update")
	public void setUpdate(ApprovalVO approvalVO, Model model, Pager pager) throws Exception {
		approvalVO = approvalService.getDetail(approvalVO);
		List<ApprovalTypeVO> total = approvalTypeService.getTotalList(pager);

		model.addAttribute("vo", approvalVO);
		model.addAttribute("list", total);
	}

	@PostMapping("update")
	public String setUpdate(ApprovalVO approvalVO, HttpServletRequest request) throws Exception {

		String path = request.getRequestURI();
		approvalVO = (ApprovalVO) makeColumn.getModColumn(approvalVO, path, id);

		log.warn("********{}******", approvalVO);

		int result = approvalService.setUpdate(approvalVO);

		return "redirect:/approval/totalList";
	}

//	첨언 추가
	@PostMapping("oneUpdate")
	public String setOneUpdate(ApprovalVO approvalVO, HttpServletRequest request) throws Exception {
		String path = request.getRequestURI();
		// Long redirectNo=approvalVO.getApprovalNo();
		approvalVO = (ApprovalVO) makeColumn.getModColumn(approvalVO, path, id);

		log.warn("들어오는지확인");

		int result = approvalService.setOneUpdate(approvalVO);

		return "redirect:/approval/detail?approvalNo=" + approvalVO.getApprovalNo();
	}

	@PostMapping("check")
	public String setCheck(ApprovalVO approvalVO, HttpServletRequest request,Model model) throws Exception {

		String path = request.getRequestURI();
		// Long redirectNo=approvalVO.getApprovalNo();
		approvalVO = (ApprovalVO) makeColumn.getModColumn(approvalVO, path, id);

		log.warn("들어오는지확인");
		
        int result=0;
        String message="검토";
		if (approvalVO.getApprovalStatusCd().equals("R033")) {
            result = approvalService.setEndCheck(approvalVO);
            message="승인";
            //결재 승인
		} else if (approvalVO.getApprovalStatusCd().equals("R034")) {
            result = approvalService.setReject(approvalVO);
            message="반려";
            //반려
		} else {
			result = approvalService.setCheck(approvalVO);
			//결재 검토만
		}
        
		if(result>0) {
			model.addAttribute("message", "결재가 성공적으로 "+message+"되었습니다");
		}else {
			model.addAttribute("message", "에러. 결재 실패");
		}
		model.addAttribute("url", "/approval/totalList");
		model.addAttribute("result", result);
		
		return "commons/result";
	}

}
