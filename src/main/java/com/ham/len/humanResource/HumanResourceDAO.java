package com.ham.len.humanresource;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HumanResourceDAO {
	public List<HumanResourceVO> getHumanResource(String employeeID);
}