package com.ham.len.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.ham.len.commons.Pager;
import com.ham.len.factoryStorage.FactoryStorageVO;
import com.ham.len.materialProduct.MaterialProductVO;

@Mapper
public interface PurchaseDAO {
	
	public List<PurchaseVO> getList(Pager pager)throws Exception;
	public List<FactoryStorageVO> getList2()throws Exception;
	public List<MaterialProductVO> getList3()throws Exception;

	public int setAdd(PurchaseVO purchaseVO)throws Exception;
	
	public PurchaseVO getDetail(PurchaseVO purchaseVO)throws Exception;
	
	public int setUpdate(PurchaseVO purchaseVO)throws Exception;
	
	public int setDelete(PurchaseVO purchaseVO)throws Exception;

}
