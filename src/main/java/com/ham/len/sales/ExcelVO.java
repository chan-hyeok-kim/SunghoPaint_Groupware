package com.ham.len.sales;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExcelVO{

	private String title = "거래 명세서";
	private String corporateName;
	
	private String cliName;
	private String clientZipCode;
	private String clientAddress;
	private String clientRefAddress;
	private String clientDetailAddress;
	private String clientNumber;
	private Long toPrice;
	private Date purDate;
	private String codName;
	private String a;
	private String result;
	//수량, 단가 나중에 추가
}
