package com.ham.len.purchase;

import java.sql.Date;

import com.ham.len.VOs.ClientVO;

import com.ham.len.VOs.FactoryStorageVO;
import com.ham.len.VOs.MaterialProductVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourceVO;

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
	private String workStatusCd;
	private String clientName;
	
	private HumanResourceVO humanResourceVO;
	private ClientVO clientVO;
	private MaterialProductVO materialProductVO;
	private FactoryStorageVO factoryStorageVO;
	
}
