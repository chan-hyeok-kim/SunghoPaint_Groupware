package com.ham.len.instrument;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class InstrumentService {

	@Autowired
	private InstrumentDAO instrumentDAO; 
	
	public List<InstrumentVO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(instrumentDAO.getTotal(pager));
		return instrumentDAO.getList(pager);
	}
	
	public int setAdd(InstrumentVO instrumentVO)throws Exception{
		
		return instrumentDAO.add(instrumentVO);
		
	}
	
	public InstrumentVO getDetail(InstrumentVO instrumentVO)throws Exception{
		
		return instrumentDAO.getDetail(instrumentVO);
	}
	
	public int setUpdate(InstrumentVO instrumentVO) throws Exception{
		
		return instrumentDAO.setUpdate(instrumentVO);
	}
	
	public int setDelete(InstrumentVO instrumentVO) throws Exception{
		
		return instrumentDAO.setDelete(instrumentVO);
	}
	
	public Long getInstrumentCheck(InstrumentVO instrumentVO) throws Exception{
		
		return instrumentDAO.getInstrumentCheck(instrumentVO);
	}
	
}
