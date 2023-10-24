package com.ham.len.admin.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
