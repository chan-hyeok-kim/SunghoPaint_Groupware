package com.ham.len.purchase;

import java.sql.Date;

import com.ham.len.VOs.ClientVO;

import com.ham.len.VOs.EmployeeVO;
import com.ham.len.VOs.MaterialProductVO;
import com.ham.len.admin.CodeVO;

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
	private Date purchaseDate;
	private Long totalPrice;
	
	private ClientVO clientVO;
	private EmployeeVO employeeVO;
	private MaterialProductVO materialProductVO;
	
}
