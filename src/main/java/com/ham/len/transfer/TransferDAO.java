package com.ham.len.transfer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.humanresource.HumanResourceVO;

@Mapper
public interface TransferDAO {
	public List<HumanResourceVO> getHumanResourceList();
	public List<CodeVO> getCodeList(String upCode);
	public int setTransfer(TransferVO transferVO);
	public Long getTotal(HumanResourcePager pager);
	public List<TransferVO> getTransferList(HumanResourcePager pager);
	public TransferVO getTransfer(String transferNo);
	public int updateTransfer(TransferVO transferVO);
	public int setDelete(String transferNo);
}