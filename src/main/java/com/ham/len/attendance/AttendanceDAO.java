package com.ham.len.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanresource.HumanResourcePager;

@Mapper
public interface AttendanceDAO {
	public AttendanceVO getCurrentAttendance(String employeeID);
	public List<AttendanceVO> getMyStatus(Map<String, String> params);
	public AttendanceVO getAttendance(Map<String, Object> params);
	public int getLeaveWorkWhether(String employeeID);
	public int setGoWork(AttendanceVO attendanceVO);
	public int setLeaveWork(AttendanceVO attendanceVO);
	public List<AttendanceAccrueVO> getAttendanceAccrueList(HumanResourcePager pager);
}