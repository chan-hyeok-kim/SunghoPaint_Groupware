package com.ham.len.attendance;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.humanresource.HumanResourceService;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.util.WeekOfMonthInfoCalculator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attendance/*")
public class AttendanceController {	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("getServerDate")
	@ResponseBody
	public Date getServerDate() {
		return new Date();
	}
	
	private Map<String, String> setDateRange(String startDate, String endDate) {
		startDate = startDate.split(" ")[0].replaceAll("[ymd]", "-");
		endDate = endDate.split(" ")[0].replaceAll("[ymd]", "-");
		startDate = startDate.substring(0, startDate.length() - 1) + " " + "00:00:00";
		endDate = endDate.substring(0, endDate.length() - 1) + " " + "23:59:59";
		
		Map<String, String> params = new HashMap<>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		return params;
	}
	
	@PostMapping("myStatus")
	public String getMyStatus(@RequestParam(value = "year", defaultValue = "0")int year,
										@RequestParam(value = "month", defaultValue = "0")int month,
										@RequestParam(value = "day", required = false)Integer day,
										@RequestParam(value = "newWindow", defaultValue = "false")boolean newWindow,
										String employeeID, @AuthenticationPrincipal HumanResourceVO humanResourceVO, Model model) {
		
		if(employeeID == null) employeeID = humanResourceVO.getEmployeeID();
		
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		int weekOfMonth = 0;
		if((year == 0 && month == 0) || (year == cal.get(Calendar.YEAR) && month - 1 == cal.get(Calendar.MONTH))) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
			Map<String, Integer> currentWeekOfMonth = WeekOfMonthInfoCalculator.getCurrentWeekOfMonth(cal.getTime());
			if(currentWeekOfMonth.get("year") == year && currentWeekOfMonth.get("month") == month) {
				weekOfMonth = currentWeekOfMonth.get("weekOfMonth");
			}
		}else if(day != null) {
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);
			Map<String, Integer> currentWeekOfMonth = WeekOfMonthInfoCalculator.getCurrentWeekOfMonth(cal.getTime());
			year = currentWeekOfMonth.get("year");
			month = currentWeekOfMonth.get("month");
			weekOfMonth = currentWeekOfMonth.get("weekOfMonth");
		}
		
		String[][] weeksOfMonthInfo = WeekOfMonthInfoCalculator.getWeeksOfMonthInfo(year, month);
		
		Map<String, String> params = setDateRange(weeksOfMonthInfo[1][1], weeksOfMonthInfo[weeksOfMonthInfo.length - 1][7]);
		params.put("employeeID", employeeID);
		List<AttendanceVO> attendances = attendanceService.getMyStatus(params);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		
		Map<String, Integer> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		date.put("weekOfMonth", weekOfMonth);
		
		model.addAttribute("date", date);
		model.addAttribute("commuteWhether", attendanceService.getCommuteWhether(employeeID));
		model.addAttribute("currentAttendance", attendanceService.getCurrentAttendance(employeeID));
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		model.addAttribute("weeksOfMonthInfo_json", gson.toJson(weeksOfMonthInfo));
		model.addAttribute("attendances_json", gson.toJson(attendances));
		model.addAttribute("newWindow", newWindow);
		
		if(!newWindow) return "attendance/myStatus";
		else return "attendance/myStatus(newWindow)";
	}
	
	@PostMapping("goWork")
	@ResponseBody
	public Timestamp setGoWork(@AuthenticationPrincipal HumanResourceVO humanResourceVO, HttpServletRequest httpServletRequest) throws Exception {
		String employeeID = humanResourceVO.getEmployeeID();
		
		if(attendanceService.getCommuteWhether(employeeID).get("goWork") == false) {
			Timestamp goWorkDate = new Timestamp(new Date().getTime());
			
	        AttendanceVO attendanceVO = new AttendanceVO();
			attendanceVO.setEmployeeID(employeeID);
			attendanceVO.setAttendanceDate(goWorkDate);
			attendanceVO.setAttendanceStart(goWorkDate);
			
			attendanceService.setGoWork(attendanceVO);
			return goWorkDate;
		}
		
		return null;
	}
	
	@PostMapping("leaveWork")
	@ResponseBody
	public Timestamp setLeaveWork(@AuthenticationPrincipal HumanResourceVO humanResourceVO, HttpServletRequest httpServletRequest) throws Exception {
		String employeeID = humanResourceVO.getEmployeeID();
		
		if(attendanceService.getCommuteWhether(employeeID).get("leaveWork") == false) {
			Timestamp leaveWorkDate = new Timestamp(new Date().getTime());
	        
	        AttendanceVO attendanceVO = new AttendanceVO();
			attendanceVO.setEmployeeID(employeeID);
			attendanceVO.setAttendanceEnd(leaveWorkDate);
			
			attendanceService.setLeaveWork(attendanceVO);
			return leaveWorkDate;
		}
		
		return null;
	}
	
	@GetMapping("list")
	public String getList(@RequestParam(value = "year", defaultValue = "0")int year,
								@RequestParam(value = "month", defaultValue = "0")int month,
								HumanResourcePager pager, Model model) {
		
		if(year == 0 && month == 0) {
			Calendar calendar = Calendar.getInstance(Locale.KOREA);
			year = calendar.get(Calendar.YEAR);
			month = calendar.get(Calendar.MONTH) + 1;
		}
		
		String[][] weeksOfMonthInfo = WeekOfMonthInfoCalculator.getWeeksOfMonthInfo(year, month);
		
		Map<String, String> params = setDateRange(weeksOfMonthInfo[1][1], weeksOfMonthInfo[weeksOfMonthInfo.length - 1][7]);
		pager.setStartDate(params.get("startDate"));
		pager.setEndDate(params.get("endDate"));
		
		// { 2023001 전체 누적, 2023002 전체 누적, ... }
		List<AttendanceAccrueVO> weeksOfTotalAttendanceAccrue = attendanceService.getAttendanceAccrueList(pager); // 전체 누적
		
		/*
			{
				1주차 : { 2023001 1주차 누적, 2023002 1주차 누적, ... }
				2주차 : { 2023001 2주차 누적, 2023002 2주차 누적, ... }
				...
			}
		*/
		List<List<AttendanceAccrueVO>> weeksOfAttendanceAccrue = new ArrayList<>(); // 각 주차 누적
		for(int i = 1; i <= weeksOfMonthInfo.length - 1; i++) {
			params = setDateRange(weeksOfMonthInfo[i][1], weeksOfMonthInfo[i][weeksOfMonthInfo[i].length - 1]);
			pager.setStartDate(params.get("startDate"));
			pager.setEndDate(params.get("endDate"));
			weeksOfAttendanceAccrue.add(attendanceService.getAttendanceAccrueList(pager));
		}
		
		
		// 사원별로 데이터 분류
		Map<String, AttendanceStatusVO> attendanceStatusMap = new LinkedHashMap<>();
		
		for(AttendanceAccrueVO attendanceAccrueVO : weeksOfTotalAttendanceAccrue) {
			AttendanceStatusVO attendanceStatusVO = new AttendanceStatusVO();
			attendanceStatusVO.setEmployeeID(attendanceAccrueVO.getEmployeeID());
			attendanceStatusVO.setName(attendanceAccrueVO.getName());
			attendanceStatusVO.setProfile(attendanceAccrueVO.getProfile());
			attendanceStatusVO.setDepartmentCdName(attendanceAccrueVO.getDepartmentCdName());
			attendanceStatusVO.setPositionCdName(attendanceAccrueVO.getPositionCdName());
			
			attendanceStatusVO.setAccrues(new AttendanceAccrueVO[weeksOfMonthInfo.length]);
			attendanceStatusVO.getAccrues()[0] = attendanceAccrueVO;
			
			attendanceStatusMap.put(attendanceStatusVO.getEmployeeID(), attendanceStatusVO);
		}
		
		for(int i = 0; i < weeksOfAttendanceAccrue.size(); i++) {
			List<AttendanceAccrueVO> weekAccrue = weeksOfAttendanceAccrue.get(i);
			for(AttendanceAccrueVO attendanceAccrueVO : weekAccrue) {
				AttendanceStatusVO attendanceStatusVO = attendanceStatusMap.get(attendanceAccrueVO.getEmployeeID());
				attendanceStatusVO.getAccrues()[i + 1] = attendanceAccrueVO;
			}
		}
		
		List<AttendanceStatusVO> attendanceStatuses = new ArrayList<>();
		Iterator<String> iterator = attendanceStatusMap.keySet().iterator();
		while(iterator.hasNext()) {
			attendanceStatuses.add(attendanceStatusMap.get(iterator.next()));
		}
		
		
		Map<String, Integer> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		
		model.addAttribute("date", date);
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		model.addAttribute("attendanceStatuses", attendanceStatuses);
		model.addAttribute("pager", pager);
		model.addAttribute("departmentList", humanResourceService.getDepartmentList());
		
		return "attendance/list";
	}
}