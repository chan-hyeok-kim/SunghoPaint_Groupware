package com.ham.len.transfer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.humanResource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TransferService {
	@Autowired
	private TransferDAO transferDAO;
	
	public List<HumanResourceVO> getHumanResourceList(){
		return transferDAO.getHumanResourceList();
	}
}