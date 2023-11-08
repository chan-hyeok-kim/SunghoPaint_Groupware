package com.ham.len.humanresource;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.CodeVO;

@Mapper
public interface HumanResourceDAO {
	public HumanResourceVO getHumanResource(String employeeID);
	public Long getTotal(HumanResourcePager pager);
	public List<HumanResourceVO> getHumanResourceList(HumanResourcePager pager);
	public List<CodeVO> getDepartmentList();
	public int setRegistration(HumanResourceVO humanResourceVO);
	public int setAccountRole(AccountRoleVO accountRoleVO);
	public String getLatestEmployeeID();
}