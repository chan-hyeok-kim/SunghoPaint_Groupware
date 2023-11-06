package com.ham.len.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanResource.HumanResourceVO;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;

	public List<ApprovalVO> getList(Pager pager) throws Exception{
		pager.makePageNum(1L);
		return approvalDAO.getList(pager);
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
	
	
}
