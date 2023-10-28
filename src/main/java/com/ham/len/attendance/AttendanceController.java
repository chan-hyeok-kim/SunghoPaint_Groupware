package com.ham.len.attendance;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ham.len.util.WeekOfMonthInfoCalculator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attendance/*")
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;
	
	@PostMapping("status")
	public String getStatus(@RequestParam(value = "year", defaultValue = "0")int year, @RequestParam(value = "month", defaultValue = "0")int month, Model model) {
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		if(year == 0 && month == 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
		}
		
		String[][] weeksOfMonthInfo = WeekOfMonthInfoCalculator.getWeeksOfMonthInfo(year, month);
		
		Map<String, String> params = new HashMap<>();
		params.put("start_date", weeksOfMonthInfo[1][1].split(" ")[0].replaceAll("[ymd]", "-"));
		params.put("end_date", weeksOfMonthInfo[weeksOfMonthInfo.length - 1][7].split(" ")[0].replaceAll("[ymd]", "-"));
		List<AttendanceVO> attendances = attendanceService.getStatus(params);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		
		Map<String, Integer> date = new HashMap<>();
		
		int weekOfMonth = 1;
		if(year == cal.get(Calendar.YEAR) && month == cal.get(Calendar.MONTH) + 1) weekOfMonth = WeekOfMonthInfoCalculator.getCurrentWeekOfMonth(cal.getTime());
		
		date.put("year", year);
		date.put("month", month);
		date.put("weekOfMonth", weekOfMonth);
		
		model.addAttribute("date", date);
		model.addAttribute("weeksOfMonthInfo", weeksOfMonthInfo);
		model.addAttribute("weeksOfMonthInfo_json", gson.toJson(weeksOfMonthInfo));
		model.addAttribute("attendances_json", gson.toJson(attendances));
		
		return "attendance/status";
	}
}