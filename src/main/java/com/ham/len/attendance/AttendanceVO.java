package com.ham.len.attendance;

import java.sql.Timestamp;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO extends CodeVO {
	private Long attendanceNo;
	private String employeeID;
	private Timestamp attendanceDate;
	private Timestamp attendanceStart;
	private Timestamp attendanceEnd;
}