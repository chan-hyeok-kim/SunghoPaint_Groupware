package com.ham.len.factoryStorage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class FactoryStorageService {

	@Autowired
	private FactoryStorageDAO factoryStorageDAO;
	
	public List<FactoryStorageVO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(factoryStorageDAO.getTotal(pager));
		return factoryStorageDAO.getList(pager);
	}
	
	public int setAdd(FactoryStorageVO factoryStorageVO)throws Exception{
		
		return factoryStorageDAO.add(factoryStorageVO);
		
	}
	
	public FactoryStorageVO getDetail(FactoryStorageVO factoryStorageVO)throws Exception{
		
		return factoryStorageDAO.getDetail(factoryStorageVO);
	}
	
	public int setUpdate(FactoryStorageVO factoryStorageVO) throws Exception{
		
		return factoryStorageDAO.setUpdate(factoryStorageVO);
	}
	
	public int setDelete(FactoryStorageVO factoryStorageVO) throws Exception{
		
		return factoryStorageDAO.setDelete(factoryStorageVO);
	}
	
	public Long getFactoryCheck(FactoryStorageVO factoryStorageVO) throws Exception{
		
		return factoryStorageDAO.getFactoryCheck(factoryStorageVO);
	}
}
