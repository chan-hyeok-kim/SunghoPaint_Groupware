package com.ham.len.humanresource;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HumanResourceDAO {
	public HumanResourceVO getHumanResource(String employeeID);
}