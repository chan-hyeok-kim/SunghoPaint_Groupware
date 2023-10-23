package com.ham.order;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class OrderVO {
	private Long orderNo;
	private Long materialProductNo;
	private Long clientNo;
	private String employeeId;
	private Date orderDeliveryDate;
	private Long totalPrice;
	private String OrderCd;
	private String modMenu;
	private String regId;
	private Date regdate;
	private String regMenu;
	private String modId;																																																																																																										;
	private Date modDate;

}
