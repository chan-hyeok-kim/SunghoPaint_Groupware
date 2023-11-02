package com.ham.len.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO;
	
	public List<PurchaseVO> getList(Pager pager)throws Exception{
		
		return purchaseDAO.getList(pager);
	}
	
	
	public int setAdd(PurchaseVO purchaseVO)throws Exception{
		
		log.info("PurchaseNo : {}", purchaseVO.getPurchaseNo());
		int result= purchaseDAO.setAdd(purchaseVO);
		log.info("=====================");
		log.info("PurchaseNo : {}", purchaseVO.getPurchaseNo());
	
		return result;
	}
	
	public PurchaseVO getDetail(PurchaseVO purchaseVO)throws Exception{
		
		return purchaseDAO.getDetail(purchaseVO);
	}
	
	public int setUpdate(PurchaseVO purchaseVO)throws Exception{
		
		return purchaseDAO.setUpdate(purchaseVO);
	}
	
	public int setDelete(PurchaseVO  purchaseVO)throws Exception{
		return purchaseDAO.setDelete(purchaseVO);
	}
	
}
