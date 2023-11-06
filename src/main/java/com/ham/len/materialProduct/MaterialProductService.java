package com.ham.len.materialProduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class MaterialProductService {

	@Autowired
	private MaterialProductDAO materialDAO; 
	
	public List<MaterialProductVO> getList(Pager pager) throws Exception{
		
		pager.makePageNum(materialDAO.getTotal(pager));
		return materialDAO.getList(pager);
	}
	
	public int setAdd(MaterialProductVO materialVO)throws Exception{
		
		return materialDAO.add(materialVO);
		
	}
	
	public MaterialProductVO getDetail(MaterialProductVO materialVO)throws Exception{
		
		return materialDAO.getDetail(materialVO);
	}
	
	public int setUpdate(MaterialProductVO materialVO) throws Exception{
		
		return materialDAO.setUpdate(materialVO);
	}
	
	public void setDelete(MaterialProductVO materialVO) throws Exception{
		
		materialDAO.setDelete(materialVO);
	}
}
