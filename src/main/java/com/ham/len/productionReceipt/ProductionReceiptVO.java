package com.ham.len.productionreceipt;

import java.sql.Date;

import com.ham.len.admin.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ProductionreceiptVO extends CodeVO {
	
	private Long productNo;
	private Long materialProductNo;
	private Long factoryNo;
	private String employeeId;
	private Date receiptDate;
	private Long quantity;

}
