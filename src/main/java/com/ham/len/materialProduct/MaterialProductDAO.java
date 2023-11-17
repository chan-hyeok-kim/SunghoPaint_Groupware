package com.ham.len.materialProduct;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface MaterialProductDAO {

	public List<MaterialProductVO> getList(Pager pager) throws Exception;
	
	public List<MaterialProductVO> getList2() throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int add(MaterialProductVO materialVO) throws Exception;
	
	public MaterialProductVO getDetail(MaterialProductVO materialVO) throws Exception;
	
	public int setUpdate(MaterialProductVO materialVO) throws Exception;
	
	public int setDelete(MaterialProductVO materialVO) throws Exception;
	
	public Long getMaterialCheck(MaterialProductVO materialVO) throws Exception;
}
