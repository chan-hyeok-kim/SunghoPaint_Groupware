package com.ham.len.transfer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanResource.HumanResourceVO;

@Mapper
public interface TransferDAO {
	public List<HumanResourceVO> getHumanResourceList();
}