package com.ham.len.sales;



import java.sql.Date;
import java.sql.Timestamp;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarReservationVO extends CodeVO{
	
	private Integer rentalNo;
	private Integer carNo;
	private Timestamp rentalDate;
	private String employeeId;
	private String rentalReasonCd;
	private String rentalLocation;
	private Timestamp returnDate;

    private String name;
}
