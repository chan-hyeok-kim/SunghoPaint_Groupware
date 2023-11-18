package com.ham.len.approval;

import java.io.Console;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;
import com.ham.len.commons.ZtreeVO;
import com.ham.len.humanresource.HumanResourceService;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.humanresource.RoleVO;
import com.ham.len.humanresource.sign.SignatureService;
import com.ham.len.main.AlarmSetting;
import com.ham.len.main.MainService;
import com.ham.len.main.NotificationVO;
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
	private HumanResourceService humanResourceService;
	
	@Autowired
	private SignatureService signatureService;

	@Autowired
	private MainService mainService;
	
	@Autowired
	private AlarmSetting alarmSetting;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
		List<ApprovalVO> ar = approvalService.getMyList(pager);
		
		//approvalService.getMyList(ar, model, humanResourceVO,pager);
		
		
        model.addAttribute("member", humanResourceVO);
       
		
		 model.addAttribute("list", ar);
		 log.warn("========{}========", ar);
		 
		return "approval/list";
	}
    
	@GetMapping("ajaxTotalList")
	public void getStatusAdminList(ApprovalVO approvalVO,Pager pager, Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
		List<ApprovalVO> ar = approvalService.getStatusAdminList(approvalVO,pager);
       	model.addAttribute("list", ar);
       	
       	
	}
	
	@GetMapping("ajaxList")
	public String getStatusList(ApprovalVO approvalVO,Pager pager, Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
        List<ApprovalVO> ar = approvalService.getStatusList(approvalVO,pager,humanResourceVO);
		
        model.addAttribute("list", ar);
        model.addAttribute("member", humanResourceVO);
        
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
			model.addAttribute("member", humanResourceVO);
		}

	}

	@PostMapping("add")
	public String setAdd(ApprovalVO approvalVO, HttpServletRequest request) throws Exception {

		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
		// 나머지 값 세팅
		approvalVO.setEmployeeID(id);
	    approvalVO.setDrafter(humanResourceVO.getName());
	    approvalVO.setApprovalStatusCd("R032");
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
		log.warn("왜안옴{}",approvalVO);
		model.addAttribute("vo", approvalVO);

		SecurityContext context = SecurityContextHolder.getContext();
		if (!(context.getAuthentication().getPrincipal() instanceof String)) {
			HumanResourceVO humanResourceVO = (HumanResourceVO) context.getAuthentication().getPrincipal();

			humanResourceVO = signatureService.getDetail(humanResourceVO);
			model.addAttribute("sign", humanResourceVO.getSignature());
			// 사인 값 들고오기
			model.addAttribute("member", humanResourceVO);

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
	public String setUpdate(ApprovalVO approvalVO) throws Exception {
		
		log.warn("********{}******", approvalVO);

		int result = approvalService.setUpdate(approvalVO);

		return "redirect:/approval/totalList";
	}
	
	@PostMapping("save")
	public String setSave(ApprovalVO approvalVO,@AuthenticationPrincipal HumanResourceVO humanResourceVO,Model model) throws Exception {

		String id=humanResourceVO.getEmployeeID();
		approvalVO.setEmployeeID(id);
		approvalVO.setDrafter(humanResourceVO.getName());
		
		//기안자 이름, 아이디 세팅
		
		
		log.warn("********{}******", approvalVO);

		int result = approvalService.setAdd(approvalVO);
 
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

//	첨언 추가
	@PostMapping("oneUpdate")
	public String setOneUpdate(ApprovalVO approvalVO) throws Exception {
		
		
		log.warn("들어오는지확인");

		int result = approvalService.setOneUpdate(approvalVO);

		return "redirect:/approval/detail?approvalNo=" + approvalVO.getApprovalNo();
	}

	@PostMapping("check")
	public String setCheck(ApprovalVO approvalVO, Model model) throws Exception {
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.warn("들어오는지확인");
		
        int result=0;
        String message="검토";
        String drafterId=approvalVO.getEmployeeID();
        int check=0;
		if (approvalVO.getApprovalStatusCd().equals("R033")) {
            result = approvalService.setEndCheck(approvalVO);
            message="승인";
            
            //알람            
            if(result>0) {
        		NotificationVO notificationVO=alarmSetting.setApprovalAlarm();
        		notificationVO.setEmployeeID(drafterId);
        		log.warn("알람왜안드감{}",notificationVO);
        		result=mainService.setAlarmAdd(notificationVO);
        		check=result;
        		}
            //결재 승인
		} else if (approvalVO.getApprovalStatusCd().equals("R034")) {
            result = approvalService.setReject(approvalVO);
            message="반려";
            
            //알람            
            if(result>0) {
        		NotificationVO notificationVO=alarmSetting.setRejectAlarm();
        		notificationVO.setEmployeeID(drafterId);
        		log.warn("알람왜안드감{}",notificationVO);
        		result=mainService.setAlarmAdd(notificationVO);
        		check=result;
        		}
            
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
	
//		알람 모델 세팅
//		
		model.addAttribute("appResultCheck", check);
		if(check>0) {
			model.addAttribute("drafterId", drafterId);
		}
		
		model.addAttribute("url", "/approval/list");
		
		for(RoleVO r: humanResourceVO.getRoles()) {
			if(r.getRoleName().equals("R001")) {
				model.addAttribute("url", "/approval/totalList");
			}
		}
		//관리자인 경우엔 totalList
		//관리자가 아닌경우엔 그냥 list
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}
	
	@GetMapping("signTime")
	@ResponseBody
    public ApprovalVO getSignTime(ApprovalVO approvalVO,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		approvalVO=approvalService.getSignTime(approvalVO,humanResourceVO);
		
		String name=approvalVO.getDeptName();
		if(name!=null) {
			String[] names=name.split(" ");
			approvalVO.setDeptName(names[0]);
		}
		
		return approvalVO;
	}
	
	@GetMapping("mySignTime")
	@ResponseBody
	public ApprovalVO getMySignTime(ApprovalVO approvalVO) throws Exception{
		approvalVO=approvalService.getMySignTime(approvalVO);
		
		String name=approvalVO.getDeptName();
		if(name!=null) {
			String[] names=name.split(" ");
			approvalVO.setDeptName(names[0]);
		}
		
		return approvalVO;
	}
	
	@GetMapping("search")
    @ResponseBody
	public List<ZtreeVO> getSearch(Pager pager) throws Exception{
		 List<HumanResourceVO> hl=approvalService.getSearch(pager);
		
		 List<ZtreeVO> zl=new ArrayList<>();
			for(HumanResourceVO h: hl) {
				ZtreeVO ztreeVO=new ZtreeVO();
				
				ztreeVO.setName(h.getPositionCd()+' '+h.getName());
			    ztreeVO.setDept(h.getDepartmentCd());
				ztreeVO.setEmpId(h.getEmployeeID());
                ztreeVO.setRank(h.getPositionCd());
				
				zl.add(ztreeVO);
			}
			
			return zl;
	}
	

	
}
