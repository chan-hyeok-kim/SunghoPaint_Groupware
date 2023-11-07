package com.ham.len.factoryStorage;

import java.util.List;

import com.ham.len.commons.Pager;

public interface FactoryStorageDAO {

	public List<FactoryStorageVO> getList(Pager pager) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int add(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public FactoryStorageVO getDetail(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public int setUpdate(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public void setDelete(FactoryStorageVO factoryStorageVO) throws Exception;
}
