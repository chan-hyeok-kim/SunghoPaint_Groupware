package com.ham.len.purchase;

import java.sql.Date;

import com.ham.len.sales.SalesClientVO;
import com.ham.len.materialProduct.MaterialProductVO;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.factoryStorage.FactoryStorageVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PurchaseVO extends CodeVO {
	
	private Long purchaseNo;
	private Integer clientNo;
	private Long materialProductNo;
	private Long factoryStorageNo;
	private String employeeId;
	private Date purchaseDate;
	private Long purchaseQuantity;
	private Long totalPrice;
	private Date purchaseInDate;
	
	private SalesClientVO salesClientVO;
	private MaterialProductVO materialProductVO;
	private HumanResourceVO humanResourceVO;
	private FactoryStorageVO factoryStorageVO;
	
}
