package com.ham.len.util;

import java.util.Calendar;
import java.util.Locale;

public class WeeksOfMonth {
	private static boolean isMonthOver;
	
	public static String[][] get(int year, int month) {
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.set(year, month - 1, 1); // 0(1월) ~ 11(12월)
		
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setMinimalDaysInFirstWeek(4);
		
		// - 해당 달이 5주차까지 존재하는지 확인 -
		
		cal.set(Calendar.WEEK_OF_MONTH, 5); // 5주차로 설정
		
		int lastWeekOfMonth = 5;
		if(cal.get(Calendar.WEEK_OF_MONTH) == 1) { // 확인해보니 이번 달의 5주차가 아닌, 다음 달의 1주차인 경우(5주차가 존재하지 않는 경우)
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - 1);
			lastWeekOfMonth--;
		}
		
		// ========================================================================================
		
		String[][] weeksOfMonth = new String[lastWeekOfMonth + 1][7 + 1]; // 날짜를 편리하게 관리하기 위해 0(첫 번째) index는 비워 둠
		
		for(int i = 1; i <= lastWeekOfMonth; i++) {
			cal.set(Calendar.WEEK_OF_MONTH, i);
			cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			
			int startDayOfWeek = cal.get(Calendar.DATE);
			int currentMonth = cal.get(Calendar.MONTH);
			int lastDayOfCurrentMonth = cal.getActualMaximum(Calendar.DATE); // 현재 달의 마지막 일
			
			cal.add(Calendar.DATE, 6);
			int endDayOfWeek = cal.get(Calendar.DATE);
			int afterMonth = cal.get(Calendar.MONTH);
			
			// 마지막 주차를 구할 때 다음 달로 넘어가 버린 경우
			if(currentMonth != afterMonth) {
				endDayOfWeek += lastDayOfCurrentMonth;
				isMonthOver = true;
			}else {
				isMonthOver = false;
			}
			
			int j = 1;
			for(int k = startDayOfWeek; k <= endDayOfWeek; k++) {
				int day = (k > lastDayOfCurrentMonth) ? k - lastDayOfCurrentMonth : k;
				
				Calendar c = Calendar.getInstance(Locale.KOREA);
				c.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), day); 
				
				String[] dayOfWeek = {"일", "월", "화", "수", "목", "금", "토"};
				weeksOfMonth[i][j] = day + " " + dayOfWeek[c.get(Calendar.DAY_OF_WEEK) - 1];
				
				j++;
			}
		}
		
		return weeksOfMonth;
	}
	
	public static boolean isMonthOver() {
		return isMonthOver;
	}
}