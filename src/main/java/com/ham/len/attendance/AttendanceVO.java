package com.ham.len.attendance;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO {
	private Long attendanceNo;
	private String employeeId;
	private Date attendanceDate;
	private Date attendanceStart;
	private Date attendanceEnd;
	private String regId;
	private Date regDate;
	private String regMenu;
	private String modId;
	private Date modDate;
	private String modMenu;
}