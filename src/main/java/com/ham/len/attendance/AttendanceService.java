package com.ham.len.attendance;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.humanresource.HumanResourcePager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public Map<String, Boolean> getCommuteWhether(String employeeID) {
		Map<String, Object> params = new HashMap<>();
		params.put("employeeID", employeeID);
		params.put("date", new Date());
		AttendanceVO attendanceVO = attendanceDAO.getAttendance(params);
		
		Map<String, Boolean> commuteWhether = new HashMap<>();
		if(attendanceVO == null && attendanceDAO.getLeaveWorkWhether(employeeID) == 0) {
			commuteWhether.put("goWork", false);
			commuteWhether.put("leaveWork", true);
		}else {
			commuteWhether.put("goWork", true);
			if(attendanceVO != null) {
				commuteWhether.put("leaveWork", (attendanceVO.getAttendanceEnd() != null));
			}else {
				commuteWhether.put("leaveWork", false);
			}
		}
		
		return commuteWhether;
	}
	
	public AttendanceVO getCurrentAttendance(String employeeID) {
		return attendanceDAO.getCurrentAttendance(employeeID);
	}
	
	public List<AttendanceVO> getMyStatus(Map<String, String> params) {
		return attendanceDAO.getMyStatus(params);
	}
	
	public AttendanceVO getAttendance(Map<String, Object> params) {
		return attendanceDAO.getAttendance(params);
	}
	
	public int getLeaveWorkWhether(String employeeID) {
		return attendanceDAO.getLeaveWorkWhether(employeeID);
	}
	
	public int setGoWork(AttendanceVO attendanceVO) {
		return attendanceDAO.setGoWork(attendanceVO);
	}
	
	public int setLeaveWork(AttendanceVO attendanceVO) {
		return attendanceDAO.setLeaveWork(attendanceVO);
	}
	
	public List<AttendanceAccrueVO> getAttendanceAccrueList(HumanResourcePager pager) {
		return attendanceDAO.getAttendanceAccrueList(pager);
	}
}