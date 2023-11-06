package com.ham.len.approval;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanResource.HumanResourceVO;

@Mapper
public interface ApprovalDAO {

	public List<ApprovalVO> getList(Pager pager) throws Exception;
	
	public Long getTotal() throws Exception;
	
	public List<ApprovalVO> getStatusList(Map<String, Object> map) throws Exception;
	
	public Long getStatusTotal(ApprovalVO approvalVO) throws Exception;
	
	public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception;
		
	public ApprovalVO getDetail(ApprovalVO approvalVO) throws Exception;
	
	public int setAdd(ApprovalVO approvalVO) throws Exception;
 
	public int setUpdate(ApprovalVO approvalVO) throws Exception;
	 
	public int setDelete(ApprovalVO approvalVO) throws Exception;
	 
	public int setOneUpdate(ApprovalVO approvalVO) throws Exception;
	 
	public int setEndUpdate(ApprovalVO approvalVO) throws Exception;
	
	public int setCheck(ApprovalVO approvalVO) throws Exception;

	public int setEndCheck(ApprovalVO approvalVO) throws Exception;

	public int setReject(ApprovalVO approvalVO) throws Exception;

	 
}
