package com.ham.len.purchase;

import java.sql.Date;

import com.ham.len.commons.CommonsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PurchaseVO extends CommonsVO {
	
	private Long purchaseNo;
	private int clientNo;
	private Long materialProductNo;
	private String employeeId;
	private Date purchaseDate;
	private Long totalPrice;
	
}
