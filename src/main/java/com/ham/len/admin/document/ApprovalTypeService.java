package com.ham.len.admin.document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalTypeService {

	@Autowired
	private ApprovalTypeDAO approvalTypeDAO;
	
	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception{
		return approvalTypeDAO.setAdd(approvalTypeVO);
	}
}
