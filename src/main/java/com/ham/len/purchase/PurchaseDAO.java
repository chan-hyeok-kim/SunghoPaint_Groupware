package com.ham.len.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface PurchaseDAO {
	
	public List<PurchaseVO> getList(Pager pager)throws Exception;
	
//	public Long getTotal(Pager pager)throws Exception;

	public int setAdd(PurchaseVO purchaseVO)throws Exception;
	
	public PurchaseVO getDetail(PurchaseVO purchaseVO)throws Exception;
	
	public int setUpdate(PurchaseVO purchaseVO)throws Exception;
	
	public int setDelete(PurchaseVO purchaseVO)throws Exception;

}
