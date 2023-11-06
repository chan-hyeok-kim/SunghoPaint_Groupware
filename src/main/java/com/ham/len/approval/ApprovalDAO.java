package com.ham.len.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanResource.HumanResourceVO;

@Mapper
public interface ApprovalDAO {

	public List<ApprovalVO> getList(Pager pager) throws Exception;
	
	public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception;
		
	public ApprovalVO getDetail(ApprovalVO approvalVO) throws Exception;
	
	public int setAdd(ApprovalVO approvalVO) throws Exception;
 
	public int setUpdate(ApprovalVO approvalVO) throws Exception;
	 
	public int setDelete(ApprovalVO approvalVO) throws Exception;
	 
	public int setOneUpdate(ApprovalVO approvalVO) throws Exception;
	 
	public int setEndUpdate(ApprovalVO approvalVO) throws Exception;
	 
}
