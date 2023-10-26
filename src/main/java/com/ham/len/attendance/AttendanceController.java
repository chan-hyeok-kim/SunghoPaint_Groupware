package com.ham.len.attendance;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ham.len.util.WeeksOfMonth;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attendance/*")
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;
	
	@GetMapping("status")
	public String getStatus(Model model) {
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		String[][] weeksOfMonth = WeeksOfMonth.get(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1);
		
		Map<String, String> params = new HashMap<>();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String day = weeksOfMonth[1][1];
		
		log.info("시작 날 : {}", year + "-" + month + "-" + day);
		params.put("start_day", year + "-" + month + "-" + day);
		
		if(WeeksOfMonth.isMonthOver()) {
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
		}
		
		day = weeksOfMonth[weeksOfMonth.length - 1][7];
		
		log.info("마지막 날 : {}", year + "-" + month + "-" + day);
		params.put("end_day", year + "-" + month + "-" + day);
		
		List<AttendanceVO> attendances = attendanceService.getStatus(params);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		
		
		Map<String, Integer> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		
		model.addAttribute("date", date);
		model.addAttribute("weeksOfMonth", weeksOfMonth);
		model.addAttribute("weeksOfMonth_json", gson.toJson(weeksOfMonth));
		model.addAttribute("attendances_json", gson.toJson(attendances));
		
		return "attendance/status";
	}	
}