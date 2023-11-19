package com.ham.len.sales;


import java.sql.Date;


import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesPurchaseVO extends CodeVO {

	private Long purchaseNo;
	private Integer clientNo;
	private Long materialProductNo;
	private String employeeId;
	private Date purchaseDate;
	private Long totalPrice;
	private Long factoryStorageNo;
	
	private String clientName;
	private String clientZipCode;
	private String clientAddress;
	private String clientRefAddress;
	private String clientDetailAddress;
	private String clientNumber;
	
	private String clientManager;
	
	private String purchaseQuantity;
	private String materialProductPrice;
}
