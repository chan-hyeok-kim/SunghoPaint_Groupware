package com.ham.len.productionreceipt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface ProductionreceiptDAO {
	
	public List<ProductionreceiptVO> getList(Pager pager)throws Exception;

}
