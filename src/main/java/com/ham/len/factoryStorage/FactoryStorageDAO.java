package com.ham.len.factoryStorage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface FactoryStorageDAO {

	public List<FactoryStorageVO> getList(Pager pager) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int add(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public FactoryStorageVO getDetail(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public int setUpdate(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public int setDelete(FactoryStorageVO factoryStorageVO) throws Exception;
	
	public Long getFactoryCheck(FactoryStorageVO factoryStorageVO) throws Exception;
}
