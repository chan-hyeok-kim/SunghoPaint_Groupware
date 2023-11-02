package com.ham.len.productionReceipt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class ProductionReceiptService {
	
	@Autowired
	private ProductionReceiptDAO productionReceiptDAO;
	
	public List<ProductionReceiptVO> getList(Pager pager)throws Exception{
		pager.makePageNum(1L);
		return productionReceiptDAO.getList(pager);
	}

}
