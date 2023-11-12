package com.ham.len.annual;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnnualExcelVO extends CodeVO {
	private String employeeID;
	private String departmentCdName;
	private String name;
	private String joinDate;
	private String quitDate;
	private Integer yearsOfService;
	private Integer occurrenceAnnualLeave;
	private Integer totalAnnualLeave;
	private Integer usedAnnualLeave;
	private Integer haveAnnualLeave;
}