package com.ham.len;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ham.len.transfer.TransferService;
import com.ham.len.transfer.TransferVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class Gdj68FinalProjectApplicationTests {
	@Autowired
	TransferService transferDAO;
	
	// @Test
	void contextLoads() {
	}
	
	@Test
	void setTransfer() {
		for(int i = 0; i < 100; i++) {
			TransferVO transferVO = new TransferVO();
			transferVO.setEmployeeId("2023001");
			transferVO.setName("테스트" + i);
			transferVO.setTransferDate(new Date(new java.util.Date().getTime()));
			transferVO.setTransferTypeCd("U013");
			transferVO.setBeforePositionCd("D002");
			transferVO.setTransferPositionCd("U003");
			transferVO.setBeforeDepartmentCd("D002");
			transferVO.setTransferDepartmentCd("D006");
			transferDAO.setTransfer(transferVO);
		}
	}
}