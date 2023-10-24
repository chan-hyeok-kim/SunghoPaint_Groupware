package com.ham.len.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface PurchaseDAO {
	
	public List<PurchaseVO> getList(Pager pager)throws Exception;

	public int add(PurchaseVO purchaseVO)throws Exception;

}
