package com.ham.len.productionReceipt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface ProductionReceiptDAO {
	
	public List<ProductionReceiptVO> getList(Pager pager)throws Exception;

}
