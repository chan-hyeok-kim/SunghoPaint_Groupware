package com.ham.len.instrument;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface InstrumentDAO {

	public List<InstrumentVO> getList(Pager pager) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int add(InstrumentVO instrumentVO) throws Exception;
	
	public InstrumentVO getDetail(InstrumentVO instrumentVO) throws Exception;
	
	public int setUpdate(InstrumentVO instrumentVO) throws Exception;
	
	public int setDelete(InstrumentVO instrumentVO) throws Exception;
	
	public Long getInstrumentCheck(InstrumentVO instrumentVO) throws Exception;
	
}
