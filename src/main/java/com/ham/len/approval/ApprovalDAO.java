package com.ham.len.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDAO {

	public List<EmployeeVO> getSalesTeamList(EmployeeVO employeeVO) throws Exception;
}
