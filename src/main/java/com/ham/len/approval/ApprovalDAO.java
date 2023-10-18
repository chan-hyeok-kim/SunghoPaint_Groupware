package com.ham.len.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface ApprovalDAO {

	public List<ApprovalVO> getList(Pager pager) throws Exception;
}
