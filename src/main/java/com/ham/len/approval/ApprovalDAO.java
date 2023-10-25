package com.ham.len.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

@Mapper
public interface ApprovalDAO {

	public List<ApprovalVO> getList(Pager pager) throws Exception;
	
	public List<HumanResourceVO> getTeamList(HumanResourceVO humanResourceVO) throws Exception;
		
 
	
}
