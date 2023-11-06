package com.ham.len.approval;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;

	public List<ApprovalVO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=approvalDAO.getTotal();
		pager.makePageNum(total);
		return approvalDAO.getList(pager);
	}
	
	public List<ApprovalVO> getStatusList(ApprovalVO approvalVO, Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=approvalDAO.getStatusTotal(approvalVO);
		pager.makePageNum(total);
		
		HashMap<String, Object> map=new HashMap();
		map.put("pager",pager);
		map.put("vo", approvalVO);
		return approvalDAO.getStatusList(map);
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
	
}
