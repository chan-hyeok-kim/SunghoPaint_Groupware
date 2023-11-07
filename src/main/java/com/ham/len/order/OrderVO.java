package com.ham.len.order;

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
public class OrderVO extends CodeVO {
	private Long orderNo;
	private Long materialProductNo;
	private Long clientNo;
	private String employeeId;
	private String factoryStorageNo;
	private Date orderDeliveryDate;
	private Long totalPrice;
	private String workStatusCd;
	
	private MaterialProductVO materialProductVO;
	private ClientVO clientVO;
	private HumanResourceVO humanResourceVO;
	private FactoryStorageVO factoryStorageVO;

}
