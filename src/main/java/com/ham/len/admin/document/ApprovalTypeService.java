package com.ham.len.admin.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.admin.CodeVO;
import com.ham.len.commons.Pager;

@Service
public class ApprovalTypeService {

	@Autowired
	private ApprovalTypeDAO approvalTypeDAO;
	
	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception{
		return approvalTypeDAO.setAdd(approvalTypeVO);
	}
	
	public List<ApprovalTypeVO> getList(Pager pager) throws Exception{
		return approvalTypeDAO.getList(pager);
	}
	
	public int setUpAdd(ApprovalUpTypeVO approvalUpTypeVO) throws Exception{
        return approvalTypeDAO.setUpAdd(approvalUpTypeVO);
    }
	
	public List<ApprovalUpTypeVO> getUpList(Pager pager) throws Exception{
		return approvalTypeDAO.getUpList(pager);
	}
	
	public List<ApprovalTypeVO> getTotalList(Pager pager) throws Exception{
		return approvalTypeDAO.getTotalList(pager);
	}
	
	public ApprovalUpTypeVO getUpDetail(ApprovalUpTypeVO approvalUpTypeVO) throws Exception{
		return approvalTypeDAO.getUpDetail(approvalUpTypeVO);
	}
	   
	
}
