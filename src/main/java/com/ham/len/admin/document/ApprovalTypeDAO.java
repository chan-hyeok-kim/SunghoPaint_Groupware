package com.ham.len.admin.document;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.admin.CodeVO;
import com.ham.len.commons.Pager;

@Mapper
public interface ApprovalTypeDAO {

	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception;
	
	public List<ApprovalTypeVO> getList(Pager pager) throws Exception;
		
	public int setUpAdd(ApprovalUpTypeVO approvalUpTypeVO) throws Exception;
	
	public List<ApprovalUpTypeVO> getUpList(Pager pager) throws Exception;
	
	public List<ApprovalTypeVO> getTotalList(Pager pager) throws Exception;

    public ApprovalUpTypeVO getUpDetail(ApprovalUpTypeVO approvalUpTypeVO) throws Exception;
    
    public ApprovalTypeVO getDetail(ApprovalTypeVO approvalTypeVO) throws Exception;
    
    public int setUpdate(ApprovalTypeVO approvalTypeVO) throws Exception;
	
    public int setDelete(ApprovalTypeVO approvalTypeVO) throws Exception;
	
    public int setUpDelete(ApprovalTypeVO approvalTypeVO) throws Exception;
}
