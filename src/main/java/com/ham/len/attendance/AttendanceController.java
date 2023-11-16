package com.ham.len.attendance;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.util.WeekOfMonthInfoCalculator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attendance/*")
public class AttendanceController {	
	@Autowired
	private AttendanceService attendanceService;
	
	@GetMapping("getServerDate")
	@ResponseBody
	public Date getServerDate() {
		return new Date();
	}
	
	@PostMapping("myStatus")
	public String getMyStatus(@RequestParam(value = "year", defaultValue = "0")int year,
										@RequestParam(value = "month", defaultValue = "0")int month,
										@RequestParam(value = "day", required = false)Integer day,
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
		
		Map<String, String> params = new HashMap<>();
		String start_date = weeksOfMonthInfo[1][1].split(" ")[0].replaceAll("[ymd]", "-");
		String end_date = weeksOfMonthInfo[weeksOfMonthInfo.length - 1][7].split(" ")[0].replaceAll("[ymd]", "-");
		start_date = start_date.substring(0, start_date.length() - 1) + " " + "00:00:00";
		end_date = end_date.substring(0, end_date.length() - 1) + " " + "23:59:59";
		params.put("employeeID", employeeID);
		params.put("start_date", start_date);
		params.put("end_date", end_date);
		
		List<AttendanceVO> attendances = attendanceService.getMyStatus(params);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		
		Map<String, Integer> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		date.put("weekOfMonth", weekOfMonth);
		
		Map<String, Boolean> commuteWhether = attendanceService.getCommuteWhether(employeeID);
		
		model.addAttribute("date", date);
		model.addAttribute("commuteWhether", commuteWhether);
		model.addAttribute("currentAttendance", attendanceService.getCurrentAttendance(commuteWhether));
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		model.addAttribute("weeksOfMonthInfo_json", gson.toJson(weeksOfMonthInfo));
		model.addAttribute("attendances_json", gson.toJson(attendances));
		
		return "attendance/myStatus";
	}
	
	@PostMapping("goWork")
	@ResponseBody
	public Timestamp setGoWork(@AuthenticationPrincipal HumanResourceVO humanResourceVO, HttpServletRequest httpServletRequest) throws Exception {
		String employeeID = humanResourceVO.getEmployeeID();
		
		if(attendanceService.getCommuteWhether(employeeID).get("goWork") == false) {
			Timestamp goWorkDate = new Timestamp(new Date().getTime());
			
	        AttendanceVO attendanceVO = new AttendanceVO();
			attendanceVO.setEmployeeId(employeeID);
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
			attendanceVO.setEmployeeId(employeeID);
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
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		
		return "attendance/list";
	}
}