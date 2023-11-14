package com.ham.len.annual;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnnualLeaveHistoryVO extends CodeVO {
	private Long annualLeaveHistoryNo;
	private String employeeID;
	private Date annual_leave_start;
	private Date annual_leave_end;
	private Integer used_annual_leave_count;
	private String reason;
}