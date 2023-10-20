package com.ham.len.humanResource;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HumanResourceDAO {
	public HumanResourceVO getHumanResource(String employeeID);
}