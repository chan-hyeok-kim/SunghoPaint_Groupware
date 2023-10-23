package com.ham.len.admin.document;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalTypeDAO {

	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception;
	
}
