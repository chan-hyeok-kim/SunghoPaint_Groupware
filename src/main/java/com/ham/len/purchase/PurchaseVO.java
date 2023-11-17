package com.ham.len.purchase;

import java.sql.Date;
import java.util.List;

import com.ham.len.factoryStorage.FactoryStorageVO;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.materialProduct.MaterialProductVO;
import com.ham.len.sales.SalesClientVO;
import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PurchaseVO extends CodeVO {
	
	private Long purchaseNo;
	private Long clientNo;
	private Long materialProductNo;
	private String employeeID;
	private Long factoryStorageNo;
	private Date purchaseDate;
	private Long totalPrice;
	private Date purchaseInDate;
	
	private SalesClientVO salesClientVO;
	private MaterialProductVO materialProductVO;
	private HumanResourceVO humanResourseVO;
	private FactoryStorageVO factoryStorageVO;
	
}