package com.ham.len.humanresource;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.CodeVO;

@Mapper
public interface HumanResourceDAO {
	public int setRegistration(HumanResourceVO humanResourceVO);
	public String getLatestEmployeeID();
	public int setAccountRole(AccountRoleVO accountRoleVO);
	public Long getTotal(HumanResourcePager pager);
	public List<HumanResourceVO> getHumanResourceList(HumanResourcePager pager);
	public List<CodeVO> getDepartmentList();
	public HumanResourceVO getHumanResource(String employeeID);
	public List<HumanResourceExcelVO> getDepartmentalHumanResourceList(String department);
	public List<String> getAccountRole(String employeeID);
	public int setDeleteAccountRole(String employeeID);
	public int setUpdate(HumanResourceVO humanResourceVO);
	// public int setDelete(String employeeID);
	public int setUpdatePassword(HumanResourceVO humanResourceVO);
	public String getEmail(String employeeID);
}