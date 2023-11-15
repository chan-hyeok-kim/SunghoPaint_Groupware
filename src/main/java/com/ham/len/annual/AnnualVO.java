package com.ham.len.annual;

import java.sql.Date;
import java.util.List;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnnualVO extends CodeVO {
	private String employeeID;
	private String departmentCdName;
	private String name;
	private Date joinDate;
	private Date quitDate;
	private Integer yearsOfService;
	private Integer occurrenceAnnualLeave;
	private Integer totalAnnualLeave;
	private Integer usedAnnualLeave;
	private Integer haveAnnualLeave;
	private List<AnnualLeaveOccurredHistoryVO> annualLeaveOccurredHistorys;
	private List<AnnualLeaveUsedHistoryVO> annualLeaveUsedHistorys;
}