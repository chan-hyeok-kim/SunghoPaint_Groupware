package com.ham.len.purchase;

import java.sql.Date;


import com.ham.len.materialProduct.MaterialProductVO;
import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PurchaseVO extends CodeVO {
	
	private Long purchaseNo;
	private Integer clientNo;
	private Long materialProductNo;
	private String employeeId;
	private Long factoryStorageNo;
	private Date purchaseDate;
	private Long totalPrice;
	

	private MaterialProductVO materialProductVO;

	
}
