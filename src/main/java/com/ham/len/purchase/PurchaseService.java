package com.ham.len.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ham.len.VOs.ClientVO;
import com.ham.len.VOs.FactoryStorageVO;
import com.ham.len.VOs.MaterialProductVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

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
	
	
	public int setAdd(PurchaseVO purchaseVO)throws Exception{
		
		int result= purchaseDAO.setAdd(purchaseVO);

		return result;
	}
	
	public PurchaseVO getDetail(PurchaseVO purchaseVO)throws Exception{
		
		return purchaseDAO.getDetail(purchaseVO);
	}
	
	public int setUpdate(PurchaseVO purchaseVO)throws Exception{
		
		return purchaseDAO.setUpdate(purchaseVO);
	}
	
	public int setDelete(PurchaseVO purchaseVO)throws Exception{
		
		return purchaseDAO.setDelete(purchaseVO);
	}
	
	public FactoryStorageVO factorySearch(CodeVO codeVO)throws Exception{
//			리턴타입이 공장VO형 공장검색작업(매개변수가 코드VO)
//			구매DAO에 공장검색(코드VO) 리턴
		System.out.println(codeVO);
		return purchaseDAO.factorySearch(codeVO);
	}
//	제품명을 검색하려고 하는것
	public MaterialProductVO productSearch(CodeVO codeVO)throws Exception{
		
		return purchaseDAO.productSearch(codeVO);
	}
//	담당자를 검색하려고 하는것
	public HumanResourceVO humanSearch(CodeVO codeVO)throws Exception{
		
		return purchaseDAO.humanSearch(codeVO);
	}
//	거래처명을 검색하려고 하는것
	public ClientVO clientSearch(CodeVO codeVO)throws Exception{
		
		return purchaseDAO.clientSearch(codeVO);
	}
}
