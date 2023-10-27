package com.ham.len.humanresource.sign;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SignatureDAO {

    public SignatureVO getDetail(SignatureVO signVO) throws Exception;
    
	public int setAdd(SignatureVO signVO) throws Exception;
	
	public int setUpdate(SignatureVO signVO) throws Exception;
	
	public int setDelete(SignatureVO signVO) throws Exception;
}
