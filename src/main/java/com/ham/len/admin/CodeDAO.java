package com.ham.len.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;

@Mapper
public interface CodeDAO {

	public CodeVO getDetail(CodeVO codeVO) throws Exception;
	
	public List<CodeVO> getList() throws Exception;
	
	public Long getCodeCheck(CodeVO codeVO) throws Exception;
	
	public int setAdd(CodeVO codeVO) throws Exception;
	
	public int setUpdate(CodeVO codeVO) throws Exception;
	
	public int setDelete(CodeVO codeVO) throws Exception;
	
	public int setUpDelete(UpCodeVO upCodeVO) throws Exception;
	
	public String getLastId(CodeVO codeVO) throws Exception;
	
	public List<UpCodeVO> getUpList(Pager pager) throws Exception;
	
	public Long getUpTotal(Pager pager) throws Exception;
	
	public List<CodeVO> getListByUpCode(CodeVO codeVO) throws Exception;
	
	public int setUpAdd(UpCodeVO upCodeVO) throws Exception;
	
	public int setUpUpdate(UpCodeVO upCodeVO) throws Exception;
	
	public Long getUpCodeCheck(UpCodeVO upCodeVO) throws Exception;
	
	public List<CodeVO> getApprovalLineDept() throws Exception;
}
