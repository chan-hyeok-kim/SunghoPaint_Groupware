package com.ham.len.transfer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TransferService {
	@Autowired
	private TransferDAO transferDAO;
	
	public List<HumanResourceVO> getHumanResourceList(){
		return transferDAO.getHumanResourceList();
	}
	
	public List<CodeVO> getCodeList(String upCode){
		return transferDAO.getCodeList(upCode);
	}
	
	public int setTransfer(TransferVO transferVO) {
		return transferDAO.setTransfer(transferVO);
	}
	
	public List<TransferVO> getTransferList(HumanResourcePager pager){
		pager.makeRowNum();
		pager.makePageNum(transferDAO.getTotal(pager));
		return transferDAO.getTransferList(pager);
	}
	
	public TransferVO getTransfer(String transferNo){
		return transferDAO.getTransfer(transferNo);
	}
	
	public int updateTransfer(TransferVO transferVO) {
		return transferDAO.updateTransfer(transferVO);
	}
	
	public int setDelete(String transferNo) {
		return transferDAO.setDelete(transferNo);
	}
}