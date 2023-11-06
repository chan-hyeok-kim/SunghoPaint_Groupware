package com.ham.len.humanResource.sign;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanResource.HumanResourceVO;

@Mapper
public interface SignatureDAO {

    public HumanResourceVO getDetail(HumanResourceVO humanResourceVO) throws Exception;
    
	public int setSignUpdate(HumanResourceVO humanResourceVO) throws Exception;
	
	
}
