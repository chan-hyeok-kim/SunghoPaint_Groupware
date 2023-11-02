package com.ham.len.transfer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanResource.HumanResourceVO;

@Mapper
public interface TransferDAO {
	public List<HumanResourceVO> getHumanResourceList();
	public List<CodeVO> getCodeList(String upCode);
	public int setTransfer(TransferVO transferVO);
	public List<TransferVO> getTransferList();
}