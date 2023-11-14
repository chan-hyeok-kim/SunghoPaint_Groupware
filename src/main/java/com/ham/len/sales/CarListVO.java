package com.ham.len.sales;

import java.sql.Timestamp;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarListVO extends CodeVO{
	private Integer carNo;
	private String carModelCd;
	private String carModelName;
	private String carStatusCd;
	private String carReason;
	
	private CarReservationVO carReservationVO;
	
	private String name;
}
