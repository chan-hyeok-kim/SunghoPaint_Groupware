package com.ham.len.materialProduct;

import java.util.List;

import com.ham.len.commons.Pager;

public interface MaterialProductDAO {

	public List<MaterialProductVO> getList(Pager pager) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int add(MaterialProductVO materialVO) throws Exception;
	
	public MaterialProductVO getDetail(MaterialProductVO materialVO) throws Exception;
	
	public int setUpdate(MaterialProductVO materialVO) throws Exception;
	
	public void setDelete(MaterialProductVO materialVO) throws Exception;
}
