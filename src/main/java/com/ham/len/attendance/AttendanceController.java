package com.ham.len.attendance;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ham.len.humanResource.HumanResourceVO;
import com.ham.len.util.WeekOfMonthInfoCalculator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attendance/*")
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;
	
	private Map<String, Boolean> getTodayCommuteWhether() {
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		String date = year + "-" + month + "-" + day + " ";
		
		Map<String, String> params = new HashMap<>();
		String start_date =  date + "00:00:00";
		String end_date = date + "23:59:59";
		
		params.put("start_date", start_date);
		params.put("end_date", end_date);
		List<AttendanceVO> attendances = attendanceService.getStatus(params);
		
		Map<String, Boolean> todayCommuteWhether = new HashMap<>();
		if(attendances.size() == 0) {
			todayCommuteWhether.put("goWork", false);
			todayCommuteWhether.put("leaveWork", false);
		}else {
			todayCommuteWhether.put("goWork", true);
			
			AttendanceVO attendanceVO = attendances.get(0);
			todayCommuteWhether.put("leaveWork", (attendanceVO.getAttendanceEnd() != null) ? true : false);
		}
		
		return todayCommuteWhether;
	}
	
	@PostMapping("status")
	public String getStatus(@RequestParam(value = "year", defaultValue = "0")int year,
									@RequestParam(value = "month", defaultValue = "0")int month,
									@RequestParam(value = "day", required = false)Integer day,
									Model model) {
		
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		int weekOfMonth = 0;
		if(year == 0 && month == 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
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
		params.put("start_date", start_date);
		params.put("end_date", end_date);
		
		List<AttendanceVO> attendances = attendanceService.getStatus(params);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		
		Map<String, Integer> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		date.put("weekOfMonth", weekOfMonth);
		
		model.addAttribute("date", date);
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		model.addAttribute("weeksOfMonthInfo_json", gson.toJson(weeksOfMonthInfo));
		model.addAttribute("attendances_json", gson.toJson(attendances));
		model.addAttribute("todayCommuteWhether", getTodayCommuteWhether());
		
		return "attendance/status";
	}
	
	@PostMapping("goWork")
	@ResponseBody
	public int setGoWork(@AuthenticationPrincipal HumanResourceVO humanResourceVO, @RequestParam(value = "start")String start, HttpServletRequest httpServletRequest) throws Exception {
		if(getTodayCommuteWhether().get("goWork") == false) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Timestamp timestamp = new Timestamp(sdf.parse(start).getTime());
	        
	        String referer = httpServletRequest.getHeader("Referer");
	        String menu = referer.substring(referer.lastIndexOf("/") + 1) + ".jsp";
			
	        AttendanceVO attendanceVO = new AttendanceVO();
			attendanceVO.setEmployeeId(humanResourceVO.getEmployeeID());
			attendanceVO.setAttendanceDate(timestamp);
			attendanceVO.setAttendanceStart(timestamp);
			attendanceVO.setRegId(humanResourceVO.getEmployeeID());
			attendanceVO.setRegDate(timestamp);
			attendanceVO.setRegMenu(menu);
			attendanceVO.setModId(humanResourceVO.getEmployeeID());
			attendanceVO.setModDate(timestamp);
			attendanceVO.setModMenu(menu);
			
			return attendanceService.setGoWork(attendanceVO);
		}
		
		return 0;
	}
	
	@PostMapping("leaveWork")
	@ResponseBody
	public int setLeaveWork(@AuthenticationPrincipal HumanResourceVO humanResourceVO, @RequestParam(value = "end")String end, HttpServletRequest httpServletRequest) throws Exception {
		if(getTodayCommuteWhether().get("leaveWork") == false) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Timestamp timestamp = new Timestamp(sdf.parse(end).getTime());
	        
	        String referer = httpServletRequest.getHeader("Referer");
	        String menu = referer.substring(referer.lastIndexOf("/") + 1) + ".jsp";
			
	        AttendanceVO attendanceVO = new AttendanceVO();
			attendanceVO.setEmployeeId(humanResourceVO.getEmployeeID());
			attendanceVO.setAttendanceEnd(timestamp);
			attendanceVO.setModId(humanResourceVO.getEmployeeID());
			attendanceVO.setModDate(timestamp);
			attendanceVO.setModMenu(menu);
			
			return attendanceService.setLeaveWork(attendanceVO);
		}
		
		return 0;
	}
}