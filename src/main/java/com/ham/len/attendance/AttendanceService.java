package com.ham.len.attendance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public List<AttendanceVO> getStatus(Map<String, String> params) {
		return attendanceDAO.getStatus(params);
	}
	
	public AttendanceVO getAttendance(Map<String, Object> params) {
		return attendanceDAO.getAttendance(params);
	}
	
	public int getLeaveWorkWhether(String employeeId) {
		return attendanceDAO.getLeaveWorkWhether(employeeId);
	}
	
	public int setGoWork(AttendanceVO attendanceVO) {
		return attendanceDAO.setGoWork(attendanceVO);
	}
	
	public int setLeaveWork(AttendanceVO attendanceVO) {
		return attendanceDAO.setLeaveWork(attendanceVO);
	}
}