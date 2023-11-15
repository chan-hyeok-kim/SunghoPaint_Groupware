package com.ham.len.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;

	public List<ApprovalVO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=approvalDAO.getTotal(pager);
		pager.makePageNum(total);
		return approvalDAO.getList(pager);
	}
	
	public List<ApprovalVO> getMyList(Pager pager) throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.warn("******{}*****",humanResourceVO);
		
		pager.makeRowNum();
		Long total=approvalDAO.getMyTotal(humanResourceVO);
		pager.makePageNum(total);
		
		log.warn("몇개나오는데{}",total);
		
		Map<String, Object> map=new HashMap<>();
		map.put("vo", humanResourceVO);
		map.put("pager", pager);
		
		return approvalDAO.getMyList(map);
	}
	
	public List<ApprovalVO> getStatusList(ApprovalVO approvalVO, Pager pager,HumanResourceVO humanResourceVO) throws Exception{
		approvalVO.setEmployeeID(humanResourceVO.getEmployeeID());
		
		pager.makeRowNum();
		Long total=approvalDAO.getStatusTotal(approvalVO);
		pager.makePageNum(total);
		log.warn("몇개나오는데{}",approvalVO);
		log.warn("몇개나오는데{}",total);
		
		HashMap<String, Object> map=new HashMap();
		map.put("pager",pager);
		map.put("vo", approvalVO);
		return approvalDAO.getStatusList(map);
	}
	
	public List<ApprovalVO> getStatusAdminList(ApprovalVO approvalVO,Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=approvalDAO.getStatusAdmin(approvalVO);
		pager.makePageNum(total);
		
		HashMap<String, Object> map=new HashMap();
		map.put("pager",pager);
		map.put("vo", approvalVO);
		return approvalDAO.getStatusAdminList(map);
	}
	
	public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception{
		return approvalDAO.getTeamList(humanResourceVO);
    }
	
	public ApprovalVO getDetail(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.getDetail(approvalVO);
	}
	
	public int setAdd(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setAdd(approvalVO);
	}
	 
	public int setUpdate(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setUpdate(approvalVO);
	}
	
	public int setDelete(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setDelete(approvalVO);
	}
	 
	public int setOneUpdate(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setOneUpdate(approvalVO);
	}
	 
	public int setEndUpdate(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setEndUpdate(approvalVO);
	}
	
	public int setCheck(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setCheck(approvalVO);
	}

	public int setEndCheck(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setEndCheck(approvalVO);
	}

	public int setReject(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setReject(approvalVO);
	}
	
	public ApprovalVO getSignTime(ApprovalVO approvalVO,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		
		
		Map<String, Object> map=new HashMap<>();
		map.put("vo", approvalVO);
		map.put("id", humanResourceVO);
		return approvalDAO.getSignTime(map);
	}
	
	public ApprovalVO getMySignTime(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.getMySignTime(approvalVO);
	}
	
	
	
//	자기 결재 가져오는 메서드
	public void getMyList(List<ApprovalVO> ar,Model model,HumanResourceVO humanResourceVO,Pager pager)throws Exception{
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
	    	boolean check31=(a.getApprovalStatusCd().equals("R031"));
	        //임시저장 문서
	    	boolean check33=(a.getApprovalStatusCd().equals("R033"));
	    	//승인완료 문서
	    	boolean check34=(a.getApprovalStatusCd().equals("R034"));
	    	//반려된 문서. 본인이랑 반려시킨 사람이 볼수 있어야됨
	    	boolean check4=(a.getAddApprover()==null || a.getAddApprover().length()==0);
	    	
	    	
		    	if((check0)|| (check0 && check31) || (check1 && check42 && check4 ) || (check1 && check43) 
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
		    	if((check0) || (check0 && check31)|| (check2)) {
		    		forMid.add(a);
		    	}
	    	   
		    check3=(a.getAddApprover().equals(humanResourceVO.getEmployeeID()));
	         //추가검토자는
		     //1. R042(1회 검토 완료)이면서(check2가 true)
		     // 추가검토자 있는거 (check3이 false) 
		     //2. 2회 검토 완료된건,3회 검토 완료된건(0회와 1회의 반대) 
		     //3. 반려된 건 중에서 1회 검토인 것만 보임
		   
		    	if((check0) || (check0 && check31) ||(check3 && check42 && !check4) || (check3 && check43) || 
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
				pager.makePageNum(Long.valueOf(forLast.size()));
			}else if(check2) {
				model.addAttribute("list", forMid);
				pager.makePageNum(Long.valueOf(forMid.size()));
			}else if(check3) {
				model.addAttribute("list", forAdd);
				pager.makePageNum(Long.valueOf(forAdd.size()));
			}
			log.warn("********{}******",forLast);
		}else{
			model.addAttribute("list", ar);
			
		}
		
		
		
	}
}
