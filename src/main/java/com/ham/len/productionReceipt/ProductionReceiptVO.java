package com.ham.len.productionReceipt;

import java.sql.Date;

import com.ham.len.commons.CommonsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ProductionReceiptVO extends CommonsVO {
	
	private Long productNo;
	private Long materialProductNo;
	private Long factoryNo;
	private String employeeId;
	private Date receiptDate;
	private Long quantity;

}
