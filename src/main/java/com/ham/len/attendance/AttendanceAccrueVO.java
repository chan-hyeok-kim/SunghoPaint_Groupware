package com.ham.len.attendance;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceAccrueVO {
	private String employeeID;
	private String name;
	private String departmentCdName;
	private String positionCdName;
	private String weekAccrue;
	private String weekDefault;
	private String weekOver;
	private String weekNight;
}