package com.ham.len.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.ham.len.VOs.ClientVO;
import com.ham.len.VOs.FactoryStorageVO;
import com.ham.len.VOs.MaterialProductVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

@Mapper
public interface PurchaseDAO {
	
	public List<PurchaseVO> getList(Pager pager)throws Exception;

	public int setAdd(PurchaseVO purchaseVO)throws Exception;
	
	public PurchaseVO getDetail(PurchaseVO purchaseVO)throws Exception;
	
	public int setUpdate(PurchaseVO purchaseVO)throws Exception;
	
	public int setDelete(PurchaseVO purchaseVO)throws Exception;
	
	public FactoryStorageVO factorySearch(CodeVO codeVO)throws Exception;
//	리턴타입이 공장VO형 공장검색작업 (매개변수 값이 코드VO)
	public MaterialProductVO productSearch(CodeVO codeVO)throws Exception;
//	원료,제품명 들고올려고하는거
	public HumanResourceVO humanSearch(CodeVO codeVO)throws Exception;
//	담당자를 검색해서 불러올려고 하는것
	public ClientVO clientSearch(CodeVO codeVO)throws Exception;
//	거래처이름을 검색해서 불러올려고 하는것
}
