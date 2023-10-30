package com.ham.len.commons;

import org.springframework.stereotype.Component;

import com.ham.len.admin.CodeVO;

@Component
public class MakeColumn {

	public CodeVO getColumn(CodeVO codeVO,String path, String id) throws Exception{
		codeVO.setRegMenu(path+".jsp");
		codeVO.setModMenu(path+".jsp");
		codeVO.setRegId(id);
		codeVO.setModId(id);
		
		return codeVO;
	}
}
