package com.ham.len.order;

import java.sql.Date;

import com.ham.len.commons.CommonsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class OrderVO extends CommonsVO {
	private Long orderNo;
	private Long materialProductNo;
	private Long clientNo;
	private String employeeId;
	private Date orderDeliveryDate;
	private Long totalPrice;
	private String OrderCd;

}
