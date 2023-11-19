package com.ham.len.attendance;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceStatusVO {
	private String employeeID;
	private String name;
	private String profile;
	private String departmentCdName;
	private String positionCdName;
	private AttendanceAccrueVO[] accrues; // 0 : 전체 누적, 1 : 1주차 누적, ...
}