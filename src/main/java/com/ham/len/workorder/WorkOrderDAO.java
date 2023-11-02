package com.ham.len.workorder;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface WorkOrderDAO {
	
	public List<WorkOrderVO> getList(Pager pager)throws Exception;

}
