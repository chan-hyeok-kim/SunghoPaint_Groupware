package com.ham.len.productionreceipt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class ProductionreceiptService {
	
	@Autowired
	private ProductionreceiptDAO productionReceiptDAO;
	
	public List<ProductionreceiptVO> getList(Pager pager)throws Exception{
		pager.makePageNum(1L);
		return productionReceiptDAO.getList(pager);
	}

}
