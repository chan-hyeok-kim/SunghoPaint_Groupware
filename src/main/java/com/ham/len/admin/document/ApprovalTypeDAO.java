package com.ham.len.admin.document;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface ApprovalTypeDAO {

	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception;
	
	public List<ApprovalTypeVO> getList(Pager pager) throws Exception;
		
}
