package com.ham.len.order;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

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
	private Date orderDeliveryDate;
	private Long totalPrice;
	private String OrderCd;

}
