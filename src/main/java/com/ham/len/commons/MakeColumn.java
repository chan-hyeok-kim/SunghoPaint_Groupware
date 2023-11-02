package com.ham.len.commons;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.ham.len.commons.CodeVO;
import com.ham.len.admin.document.ApprovalUpTypeVO;

@Component
public class MakeColumn {

	@Value("${view.jsp.suffix}")
	private String suffix;
	
	@Value("${approval.typeup.cd}")
	private String typeUpCd;
	
	public CodeVO getColumn(CodeVO codeVO,String path, String id) throws Exception{
		codeVO.setRegId(id);
		codeVO.setModId(id);
		codeVO.setRegMenu(path+suffix);
		codeVO.setModMenu(path+suffix);
		
		return codeVO;
	}
	
	public CodeVO getModColumn(CodeVO codeVO, String path, String id) throws Exception{
		codeVO.setModId(id);
		codeVO.setModMenu(path+suffix);
		
		return codeVO;
	}

	public CodeVO setUpCode(CodeVO codeVO,HttpServletRequest request) throws Exception{
		String path=request.getRequestURI();
		if(path.substring(0, path.lastIndexOf("/")).equals("/document")) {
			codeVO.setUpCode(typeUpCd);
		}
		
		
		
		
		
		return codeVO;
	}
	
	
}
