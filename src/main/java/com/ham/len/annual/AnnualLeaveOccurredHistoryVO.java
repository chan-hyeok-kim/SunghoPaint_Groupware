package com.ham.len.annual;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnnualLeaveOccurredHistoryVO extends CodeVO {
	private Long annualLeaveOccurredHistoryNo;
	private String employeeID;
	private Date occurredDate;
	private Byte occurredType;
	private Integer occurredCount;
	private String description;
}