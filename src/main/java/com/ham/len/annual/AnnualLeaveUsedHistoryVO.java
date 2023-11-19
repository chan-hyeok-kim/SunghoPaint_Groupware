package com.ham.len.annual;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnnualLeaveUsedHistoryVO extends CodeVO {
	private Long annualLeaveUsedHistoryNo;
	private String employeeID;
	private Date annualLeaveStart;
	private Date annualLeaveEnd;
	private Integer usedAnnualLeaveCount;
	private String reason;
}