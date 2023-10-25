package com.ham.len.attendance;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO {
	private Long attendanceNo;
	private String employeeId;
	private Timestamp attendanceDate;
	private Timestamp attendanceStart;
	private Timestamp attendanceEnd;
	private String regId;
	private Timestamp regDate;
	private String regMenu;
	private String modId;
	private Timestamp modDate;
	private String modMenu;
}