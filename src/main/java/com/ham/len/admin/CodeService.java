package com.ham.len.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.CodeVO;
import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CodeService {
	
	@Autowired
	private CodeDAO codeDAO;

	public List<CodeVO> getList() throws Exception{

		return codeDAO.getList();
	}
	
    public int setAdd(CodeVO codeVO) throws Exception{
    	return codeDAO.setAdd(codeVO);
    }
	
	public int setUpdate(CodeVO codeVO) throws Exception{
		return codeDAO.setUpdate(codeVO);
	}
	
	public int setDelete(CodeVO codeVO) throws Exception{
		return codeDAO.setDelete(codeVO);
	}
	
	public String getLastId(CodeVO codeVO) throws Exception{
		return codeDAO.getLastId(codeVO);
	}
	
	public Long getCodeCheck(CodeVO codeVO) throws Exception{
		return codeDAO.getCodeCheck(codeVO);
	}
	
	public List<UpCodeVO> getUpList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=codeDAO.getUpTotal(pager);
		pager.makePageNum(total);
		
		return codeDAO.getUpList(pager);
	}
	
	public List<CodeVO> getListByUpCode(CodeVO codeVO) throws Exception{
		return codeDAO.getListByUpCode(codeVO);
	}
	
	

}
