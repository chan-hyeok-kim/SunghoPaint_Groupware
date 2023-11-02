package com.ham.len.util;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class WeekOfMonthInfoCalculator {
	public static Map<String, Integer> getCurrentWeekOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DATE);
		
		// 한 주의 시작은 월요일이고, 첫 주에 4일이 포함되어 있어야 첫 주 취급(목/금/토/일)
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setMinimalDaysInFirstWeek(4);
		
		int weekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH);
		
		// 첫 주에 해당하지 않는 주의 경우, 전 달 마지막 주차로 계산
		if(weekOfMonth == 0) {
			calendar.add(Calendar.DATE, -day); // 전 달의 마지막 날 기준
			return getCurrentWeekOfMonth(calendar.getTime());
		}
		
		// 마지막 주차의 경우
		if(weekOfMonth == calendar.getActualMaximum(Calendar.WEEK_OF_MONTH)) {
			calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE)); // 이번 달의 마지막 날
			int lastDaysDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); // 이번 달 마지막 날의 요일
			
			// 마지막 날이 월 ~ 수 사이이면 다음 달 1주차로 계산
			if(lastDaysDayOfWeek >= Calendar.MONDAY && lastDaysDayOfWeek <= Calendar.WEDNESDAY) {
				calendar.add(Calendar.DATE, 1); // 마지막 날 + 1일 → 다음 달 1일
				return getCurrentWeekOfMonth(calendar.getTime());
			}
		}
		
		Map<String, Integer> currentWeekOfMonth = new HashMap<>();
		currentWeekOfMonth.put("year", year);
		currentWeekOfMonth.put("month", month);
		currentWeekOfMonth.put("weekOfMonth", weekOfMonth);
		return currentWeekOfMonth;
	}
	
	public static String[][] getWeeksOfMonthInfo(int year, int month) {
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.set(year, month - 1, 1); // 0(1월) ~ 11(12월)
		
		// 한 주의 시작은 월요일이고, 첫 주에 4일이 포함되어 있어야 첫 주 취급(목/금/토/일)
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setMinimalDaysInFirstWeek(4);
		
		/*
 			버그인지 아닌지는 잘 모르겠지만, 아래 64번째 라인("cal.set(Calendar.WEEK_OF_MONTH, 5);")을 실행하기 이전에
 			이처럼 get 메서드를 한 번 실행해주어야 67번째 라인("cal.get(Calendar.WEEK_OF_MONTH)")를 실행했을 때 정상적인 결과가 나온다.
 			※참고로 반드시 WEEK_OF_MONTH가 아니어도 된다.  →  cal.get(Calendar.아무거나 상관없음);
		*/
		cal.get(Calendar.WEEK_OF_MONTH);
		
		// - 해당 달이 5주차까지 존재하는지 확인 -
		
		cal.set(Calendar.WEEK_OF_MONTH, 5); // 5주차로 설정
		
		int lastWeekOfMonth = 5;
		if(cal.get(Calendar.WEEK_OF_MONTH) == 1) { // 확인해보니 이번 달의 5주차가 아닌, 다음 달의 1주차인 경우(5주차가 존재하지 않는 경우)
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - 1);
			lastWeekOfMonth--;
		}
		
		// ========================================================================================
		
		String[][] weeksOfMonthInfo = new String[lastWeekOfMonth + 1][7 + 1]; // 날짜를 편리하게 관리하기 위해 0(첫 번째) index는 비워 둠
		
		for(int i = 1; i <= lastWeekOfMonth; i++) {
			cal.set(Calendar.WEEK_OF_MONTH, i); // i주차로 설정
			cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // 주의 첫날 설정(월요일)
			
			int lastDayOfCurrentMonth = cal.getActualMaximum(Calendar.DATE); // 현재 달의 마지막 일
			
			int currentYear = cal.get(Calendar.YEAR);
			int currentMonth = cal.get(Calendar.MONTH);
			int startDayOfWeek = cal.get(Calendar.DATE);
			
			cal.add(Calendar.DATE, 6); // 주의 마지막 날 설정(일요일)
			int afterYear = cal.get(Calendar.YEAR);
			int afterMonth = cal.get(Calendar.MONTH);
			int endDayOfWeek = cal.get(Calendar.DATE);
			
			// 마지막 주차를 구할 때 다음 달로 넘어가 버린 경우
			if(currentMonth != afterMonth) endDayOfWeek += lastDayOfCurrentMonth;
			
			int j = 1;
			for(int k = startDayOfWeek; k <= endDayOfWeek; k++) {
				year = 0;
				month = 0;
				int day = 0;
				
				if(k <= lastDayOfCurrentMonth) {
					year = currentYear;
					month = currentMonth;
					day = k;
				}else { // 다음 달로 넘어간 경우
					year = afterYear;
					month = afterMonth;
					day = k - lastDayOfCurrentMonth;
				}
				
				Calendar c = Calendar.getInstance(Locale.KOREA);
				c.set(year, month, day);
				
				String[] dayOfWeek = {"일", "월", "화", "수", "목", "금", "토"};
				weeksOfMonthInfo[i][j] = year + "y" + (month + 1) + "m" + day + "d" + " " + dayOfWeek[c.get(Calendar.DAY_OF_WEEK) - 1];
				
				j++;
			}
		}
		
		return weeksOfMonthInfo;
	}
}