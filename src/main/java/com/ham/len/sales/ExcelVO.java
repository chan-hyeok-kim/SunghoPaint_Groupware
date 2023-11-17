package com.ham.len.sales;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExcelVO extends CodeVO{

	private String title;
	private String corporateName;
	
	private String clientName;
	private String clientAddress;
	private String clientRefAddress;
	private String clientDetailAddress;
	private String clientNumber;
	private Long totalPrice;
	private Date purchaseDate;
	
	//수량, 단가 나중에 추가
}
