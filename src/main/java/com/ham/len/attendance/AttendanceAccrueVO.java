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
	private String profile;
	private String departmentCdName;
	private String positionCdName;
	private String weekAccrue;
	private String weekDefault;
	private String weekOver;
	private String weekNight;
	
	public String getWeekAccrue() {
		return formatTime(weekAccrue);
	}
	
	public String getWeekDefault() {
		return formatTime(weekDefault);
	}
	
	public String getWeekOver() {
		return formatTime(weekOver);
	}
	
	public String getWeekNight() {
		return formatTime(weekNight);
	}
	
	private String formatTime(String time) {
		String[] splitted = time.split(":");
		return splitted[0] + "h " + splitted[1] + "m " + splitted[2] + "s";
	}
}