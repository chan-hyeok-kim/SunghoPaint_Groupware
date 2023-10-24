package com.ham.len.commons;

import org.springframework.stereotype.Component;

import com.ham.len.CommonsVO;

@Component
public class MakeColumn {

	public CommonsVO getColumn(CommonsVO commonsVO,String path, String id) throws Exception{
		commonsVO.setRegMenu(path+".jsp");
		commonsVO.setModMenu(path+".jsp");
		commonsVO.setRegId(id);
		commonsVO.setModId(id);
		
		return commonsVO;
	}
}
