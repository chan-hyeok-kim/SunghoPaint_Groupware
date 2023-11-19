package com.ham.len.sales;

import java.sql.Date;
import java.sql.Timestamp;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesClientVO extends CodeVO {
	private Integer clientNo;
	private String clientName;
	private String clientTypeCd;
	private String clientRepresent;
	private String clientNumber;
	private String clientAddress;
	private Integer clientZipCode;
	private String clientRefAddress;
	private String clientDetailAddress;
	private Date clientDate;
	private String employeeId;
	private String clientIndustry;
	private String clientManager;
	private String clientPhone;
	private String clientBank;
	private String clientAccountNo;
	private String clientBankName;
	
	private String name;
}
