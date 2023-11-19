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
public class AnnualAddVO extends CodeVO{

	private Integer scheduleNo;
	private String employeeId;
	private Date scheduleDate;
	private Date scheduleEndDate;
	private String scheduleContents;
	private Integer scheduleType;
	
	private String name;
	private String departmentCd;
}
