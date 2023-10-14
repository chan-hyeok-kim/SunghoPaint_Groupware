package com.ham.len.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;

	public List<EmployeeVO> getSalesTeamList(EmployeeVO employeeVO) throws Exception{
		return approvalDAO.getSalesTeamList(employeeVO);
	}
	
}
