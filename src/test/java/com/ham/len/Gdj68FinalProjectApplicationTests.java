package com.ham.len;

import java.sql.Date;
import java.util.Calendar;
import java.util.Locale;

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
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.set(Calendar.YEAR, 2023);
		cal.set(Calendar.MONDAY, 0);
		
		for(int i = 1; i <= 100; i++) {
			cal.set(Calendar.DATE, i);
			
			TransferVO transferVO = new TransferVO();
			transferVO.setEmployeeId("2023001");
			transferVO.setName("테스트" + i);
			transferVO.setTransferDate(new Date(cal.getTimeInMillis()));
			transferVO.setTransferTypeCd("U013");
			transferVO.setBeforePositionCd("D002");
			transferVO.setTransferPositionCd("U003");
			transferVO.setBeforeDepartmentCd("D002");
			transferVO.setTransferDepartmentCd("D006");
			transferDAO.setTransfer(transferVO);
		}
	}
}