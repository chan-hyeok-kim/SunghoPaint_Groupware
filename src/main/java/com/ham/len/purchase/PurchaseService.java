package com.ham.len.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO;
	
	public List<PurchaseVO> getList(Pager pager)throws Exception{
		pager.makePageNum(1L);
		return purchaseDAO.getList(pager);
	}
	
	
	public int add(PurchaseVO purchaseVO)throws Exception{
		
		log.info("PurchaseNo : {}", purchaseVO.getPurchaseNo());
		int result= purchaseDAO.add(purchaseVO);
		log.info("=====================");
		log.info("PurchaseNo : {}", purchaseVO.getPurchaseNo());
	
		return result;
	}
	
}
