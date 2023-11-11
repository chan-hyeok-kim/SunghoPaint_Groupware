package com.ham.len.approval;

import java.io.Console;
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
import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.humanresource.RoleVO;
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

	@GetMapping("list")
	public String getList(Pager pager, Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
		List<ApprovalVO> ar = approvalService.getMyList(pager);
		
		List<ApprovalVO> forLast=new ArrayList<>();
		List<ApprovalVO> forMid=new ArrayList<>();
		List<ApprovalVO> forAdd=new ArrayList<>();
		boolean check1=false;
		boolean check2=false;
		boolean check3=false;
		
	    for(ApprovalVO a: ar) {
	    	boolean check0=(a.getEmployeeID().equals(humanResourceVO.getEmployeeID()));
	    	//로그인한 사람이 기안자와 같을 경우
	    	check1=(a.getLastApprover().equals(humanResourceVO.getEmployeeID()));
	    	
	    	boolean check41=(a.getApprovalCheckCd().equals("R041"));
	    	//0회 검토완료
	    	boolean check42=(a.getApprovalCheckCd().equals("R042"));
	    	//1회 검토완료
	    	boolean check43=(a.getApprovalCheckCd().equals("R043"));
	    	//2회 검토완료
	    	boolean check44=(a.getApprovalCheckCd().equals("R044"));
	    	//3회 검토완료
	    	boolean check33=(a.getApprovalStatusCd().equals("R033"));
	    	//승인완료 문서
	    	boolean check34=(a.getApprovalStatusCd().equals("R034"));
	    	//반려된 문서. 본인이랑 반려시킨 사람이 볼수 있어야됨
	    	boolean check4=(a.getAddApprover()==null);
	    	
	    	
		    	if((check0) || (check1 && check42 && check4 ) || (check1 && check43) 
		    			|| (check1 && check44) || (check1 && check43 && check34)) {
		    		forLast.add(a);
		    	}
		    	    //최종 결재자는
	    	    	//1. R042(1회검토완료)이면서 추가검토자없는거
		    	    //2. 2회 검토완료된거, 3회 검토완료된거, 
		    	    //3. 자기가 반려한거(2회검토 완료+반려)
		    	
	    	check2=(a.getMidApprover().equals(humanResourceVO.getEmployeeID()));
	    	 //중간검토자는 뭘 체크해야될까
	    	 //1. R041(0회 검토)이거나
	    	 //2. 0회 검토 말고 전부
	    	 //3. 0회 검토+반려
		    	if((check0) || (check2 && check41) || (check2 && !check41) || (check2 && check41 && check34)) {
		    		forMid.add(a);
		    	}
	    	   
		    check3=(a.getAddApprover().equals(humanResourceVO.getEmployeeID()));
	         //추가검토자는
		     //1. R042(1회 검토 완료)이면서(check2가 true)
		     // 추가검토자 있는거 (check3이 false) 
		     //2. 2회 검토 완료된건,3회 검토 완료된건(0회와 1회의 반대) 
		     //3. 반려된 건 중에서 1회 검토인 것만 보임
		   
		    	if((check0) || (check3 && check42 && !check4) || (check3 && check43) || 
		    	(check3 && check44)|| (check3 && check42 && check34)) {
		    		forAdd.add(a);
		    	}
		    	
	    	
	    }
	    
	    log.warn("********{}******",check1);
	    
	    log.warn("********{}******",check2);
	    log.warn("********{}******",check3);
		if((check1 ^ check2) ^ check3) {
			if(check1) {
			    model.addAttribute("list", forLast);
			}else if(check2) {
				model.addAttribute("list", forMid);
			}else if(check3) {
				model.addAttribute("list", forAdd);
			}
			log.warn("********{}******",forLast);
		}else{
			model.addAttribute("list", ar);
		}
		
		
        model.addAttribute("member", humanResourceVO);
		log.warn("========{}========", ar);

		
		
		
		return "approval/list";
	}

	@GetMapping("ajaxList")
	public String getStatusList(ApprovalVO approvalVO,Pager pager, Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
        List<ApprovalVO> ar = approvalService.getStatusList(approvalVO,pager);
		
		List<ApprovalVO> forLast=new ArrayList<>();
		List<ApprovalVO> forMid=new ArrayList<>();
		List<ApprovalVO> forAdd=new ArrayList<>();
		boolean check1=false;
		boolean check2=false;
		boolean check3=false;
		
	    for(ApprovalVO a: ar) {
	    	boolean check0=(a.getEmployeeID().equals(humanResourceVO.getEmployeeID()));
	    	//로그인한 사람이 기안자와 같을 경우
	    	check1=(a.getLastApprover().equals(humanResourceVO.getEmployeeID()));
	    	
	    	boolean check41=(a.getApprovalCheckCd().equals("R041"));
	    	//0회 검토완료
	    	boolean check42=(a.getApprovalCheckCd().equals("R042"));
	    	//1회 검토완료
	    	boolean check43=(a.getApprovalCheckCd().equals("R043"));
	    	//2회 검토완료
	    	boolean check44=(a.getApprovalCheckCd().equals("R044"));
	    	//3회 검토완료
	    	boolean check33=(a.getApprovalStatusCd().equals("R033"));
	    	//승인완료 문서
	    	boolean check34=(a.getApprovalStatusCd().equals("R034"));
	    	//반려된 문서. 본인이랑 반려시킨 사람이 볼수 있어야됨
	    	boolean check4=(a.getAddApprover()==null);
	    	
	    	
		    	if((check0) || (check1 && check42 && check4 ) || (check1 && check43) 
		    			|| (check1 && check44) || (check1 && check43 && check34)) {
		    		forLast.add(a);
		    	}
		    	    //최종 결재자는
	    	    	//1. R042(1회검토완료)이면서 추가검토자없는거
		    	    //2. 2회 검토완료된거, 3회 검토완료된거, 
		    	    //3. 자기가 반려한거(2회검토 완료+반려)
		    	
	    	check2=(a.getMidApprover().equals(humanResourceVO.getEmployeeID()));
	    	 //중간검토자는 뭘 체크해야될까
	    	 //1. R041(0회 검토)이거나
	    	 //2. 0회 검토 말고 전부
	    	 //3. 0회 검토+반려
		    	if((check0) || (check2 && check41) || (check2 && !check41) || (check2 && check41 && check34)) {
		    		forMid.add(a);
		    	}
	    	   
		    check3=(a.getAddApprover().equals(humanResourceVO.getEmployeeID()));
	         //추가검토자는
		     //1. R042(1회 검토 완료)이면서(check2가 true)
		     // 추가검토자 있는거 (check3이 false) 
		     //2. 2회 검토 완료된건,3회 검토 완료된건(0회와 1회의 반대) 
		     //3. 반려된 건 중에서 1회 검토인 것만 보임
		   
		    	if((check0) || (check3 && check42 && !check4) || (check3 && check43) || 
		    	(check3 && check44)|| (check3 && check42 && check34)) {
		    		forAdd.add(a);
		    	}
		    	
	    	
	    }
	    
	    log.warn("********{}******",check1);
	    
	    log.warn("********{}******",check2);
	    log.warn("********{}******",check3);
		if((check1 ^ check2) ^ check3) {
			if(check1) {
			    model.addAttribute("list", forLast);
			}else if(check2) {
				model.addAttribute("list", forMid);
			}else if(check3) {
				model.addAttribute("list", forAdd);
			}
			log.warn("********{}******",forLast);
		}else{
			model.addAttribute("list", ar);
		}
		
		
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
		
		String path = request.getRequestURI();
		approvalVO = (ApprovalVO) makeColumn.getColumn(approvalVO, path, id);
     
		// 나머지 값 세팅
		approvalVO.setEmployeeID(id);
	    approvalVO.setDrafter(humanResourceVO.getName());
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

		SecurityContext context = SecurityContextHolder.getContext();
		if (!(context.getAuthentication().getPrincipal() instanceof String)) {
			HumanResourceVO humanResourceVO = (HumanResourceVO) context.getAuthentication().getPrincipal();

			humanResourceVO = signatureService.getDetail(humanResourceVO);
			model.addAttribute("sign", humanResourceVO.getSignature());
			// 사인 값 들고오기
			model.addAttribute("member", humanResourceVO);
//			String empId1=approvalVO.getEmployeeID();
//			String empId2=humanResourceVO.getEmployeeID();
//			if(empId1.equals(empId2)) {
//				
//			}
//			
//			//서명하기 체크. 사원아이디를 비교해야됨
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
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
		String path = request.getRequestURI();
		approvalVO = (ApprovalVO) makeColumn.getModColumn(approvalVO, path, id);

		log.warn("********{}******", approvalVO);

		int result = approvalService.setUpdate(approvalVO);

		return "redirect:/approval/totalList";
	}

//	첨언 추가
	@PostMapping("oneUpdate")
	public String setOneUpdate(ApprovalVO approvalVO, HttpServletRequest request) throws Exception {
		
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
		String path = request.getRequestURI();
		// Long redirectNo=approvalVO.getApprovalNo();
		approvalVO = (ApprovalVO) makeColumn.getModColumn(approvalVO, path, id);

		log.warn("들어오는지확인");

		int result = approvalService.setOneUpdate(approvalVO);

		return "redirect:/approval/detail?approvalNo=" + approvalVO.getApprovalNo();
	}

	@PostMapping("check")
	public String setCheck(ApprovalVO approvalVO, HttpServletRequest request,Model model) throws Exception {
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
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
	
	
	
}
