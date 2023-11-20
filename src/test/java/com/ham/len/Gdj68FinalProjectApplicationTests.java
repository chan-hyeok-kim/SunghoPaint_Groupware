package com.ham.len;

import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class Gdj68FinalProjectApplicationTests {
//	@Autowired
//	TransferDAO transferDAO;
//	
//	@Autowired
//	HumanResourceService humanResourceService;
//	
//	@Autowired
//	AttendanceService attendanceService;
//	
//	@Autowired
//	HumanResourceDAO humanResourceDAO;
//	
//	@Autowired
//	PasswordEncoder passwordEncoder;
//	
//	// @Test
//	void contextLoads() {
//		
//	}
//	
//	
//	// @Test
//	void setTransfer() {
//		Calendar cal = Calendar.getInstance(Locale.KOREA);
//		cal.set(Calendar.YEAR, 2023);
//		cal.set(Calendar.MONDAY, 0);
//		
//		for(int i = 1; i <= 100; i++) {
//			cal.set(Calendar.DATE, i);
//			
//			TransferVO transferVO = new TransferVO();
//			transferVO.setEmployeeID("2023001");
//			transferVO.setName("테스트" + i);
//			transferVO.setTransferDate(new Date(cal.getTimeInMillis()));
//			transferVO.setTransferTypeCd("U013");
//			transferVO.setBeforePositionCd("U004");
//			transferVO.setTransferPositionCd("U003");
//			transferVO.setBeforeDepartmentCd("D002");
//			transferVO.setTransferDepartmentCd("D006");
//			transferDAO.setTransfer(transferVO);
//		}
//	}
//	
//	
//	// @Test
//	void setRegistrationHumanresource() throws Exception {
//		for(int i = 1; i <= 100; i++) {
//			HumanResourceVO humanResourceVO = new HumanResourceVO();
//			humanResourceVO.setPassword(passwordEncoder.encode("1234"));
//			humanResourceVO.setJoinDate(Date.valueOf("2023-11-11"));
//			humanResourceVO.setJoinType((byte)0);
//			humanResourceVO.setName("테스트" + i);
//			humanResourceVO.setBirth(Date.valueOf("1995-07-28"));
//			humanResourceVO.setDepartmentCd("D001");
//			humanResourceVO.setPositionCd("U001");
//			humanResourceVO.setYearsOfService(0);
//			humanResourceVO.setPhone("010-0000-0000");
//			humanResourceVO.setEmail("dngu_icdi@naver.com");
//			humanResourceVO.setAddress("가나다라마바사");
//			humanResourceVO.setBank("신한");
//			humanResourceVO.setAccountNumber("123456789");
//			humanResourceVO.setAccountHolder("김민진");
//			humanResourceService.setRegistration(humanResourceVO, null);
//			// humanResourceDAO.setRegistration(humanResourceVO);
//		}
//		
//		/*
//			log.info("before : {}", humanResourceVO.getEmployeeID());
//			int result = humanResourceDAO.setRegistration(humanResourceVO);
//			humanResourceVO.setEmployeeID(humanResourceDAO.getLatestEmployeeID());
//			log.info("after : {}", humanResourceVO.getEmployeeID());
//			
//			new SMTP().send_mail(humanResourceVO);
//			
//			assertTrue(result > 0);
//		*/
//	}
//	
//	
//	// @Test
//	void generateTemporaryPassword() {
//		String temporaryPassword = "";
//		
//		Random rand = new Random();
//		for(int i = 0; i < 8; i++) {
//			if(rand.nextInt(2) == 0) {
//				temporaryPassword += rand.nextInt(10); // 0 ~ 9
//			}else {
//				temporaryPassword += (char)(rand.nextInt(26) + 97); // 97(a) ~ 122(z)
//			}
//		}
//        
//        log.info("temporaryPassword : {}" , temporaryPassword);
//	}
//	
//	
//	private Map<String, String> setDateRange(String startDate, String endDate) {
//		startDate = startDate.split(" ")[0].replaceAll("[ymd]", "-");
//		endDate = endDate.split(" ")[0].replaceAll("[ymd]", "-");
//		startDate = startDate.substring(0, startDate.length() - 1) + " " + "00:00:00";
//		endDate = endDate.substring(0, endDate.length() - 1) + " " + "23:59:59";
//		
//		Map<String, String> params = new HashMap<>();
//		params.put("startDate", startDate);
//		params.put("endDate", endDate);
//		
//		return params;
//	}
//	
//	@Test
//	void getAttendanceAccrue() {
//		Calendar calendar = Calendar.getInstance(Locale.KOREA);
//		int year = calendar.get(Calendar.YEAR);
//		int month = calendar.get(Calendar.MONTH) + 1;
//		
//		HumanResourcePager pager = new HumanResourcePager();
//		pager.setDepartment("D001");
//		pager.setKeyword("김");
//		
//		String[][] weeksOfMonthInfo = WeekOfMonthInfoCalculator.getWeeksOfMonthInfo(year, month);
//		
//		Map<String, String> params = setDateRange(weeksOfMonthInfo[1][1], weeksOfMonthInfo[weeksOfMonthInfo.length - 1][7]);
//		pager.setStartDate(params.get("startDate"));
//		pager.setEndDate(params.get("endDate"));
//		
//		// { 2023001 전체 누적, 2023002 전체 누적, ... }
//		List<AttendanceAccrueVO> weeksOfTotalAttendanceAccrue = attendanceService.getAttendanceAccrueList(pager); // 전체 누적
//		
//		/*
//			{
//				1주차 : { 2023001 1주차 누적, 2023002 1주차 누적, ... }
//				2주차 : { 2023001 2주차 누적, 2023002 2주차 누적, ... }
//				...
//			}
//		*/
//		List<List<AttendanceAccrueVO>> weeksOfAttendanceAccrue = new ArrayList<>(); // 각 주차 누적
//		for(int i = 1; i <= weeksOfMonthInfo.length - 1; i++) {
//			params = setDateRange(weeksOfMonthInfo[i][1], weeksOfMonthInfo[i][weeksOfMonthInfo[i].length - 1]);
//			pager.setStartDate(params.get("startDate"));
//			pager.setEndDate(params.get("endDate"));
//			weeksOfAttendanceAccrue.add(attendanceService.getAttendanceAccrueList(pager));
//		}
//		
//		
//		// 사원별로 데이터 정렬
//		Map<String, AttendanceStatusVO> attendanceStatusMap = new LinkedHashMap<>();
//		
//		for(AttendanceAccrueVO attendanceAccrueVO : weeksOfTotalAttendanceAccrue) {
//			AttendanceStatusVO attendanceStatusVO = new AttendanceStatusVO();
//			attendanceStatusVO.setEmployeeID(attendanceAccrueVO.getEmployeeID());
//			attendanceStatusVO.setName(attendanceAccrueVO.getName());
//			attendanceStatusVO.setDepartmentCdName(attendanceAccrueVO.getDepartmentCdName());
//			attendanceStatusVO.setPositionCdName(attendanceAccrueVO.getPositionCdName());
//			
//			attendanceStatusVO.setAccrues(new AttendanceAccrueVO[weeksOfMonthInfo.length]);
//			attendanceStatusVO.getAccrues()[0] = attendanceAccrueVO;
//			
//			attendanceStatusMap.put(attendanceStatusVO.getEmployeeID(), attendanceStatusVO);
//		}
//		
//		for(int i = 0; i < weeksOfAttendanceAccrue.size(); i++) {
//			List<AttendanceAccrueVO> weekAccrue = weeksOfAttendanceAccrue.get(i);
//			for(AttendanceAccrueVO attendanceAccrueVO : weekAccrue) {
//				AttendanceStatusVO attendanceStatusVO = attendanceStatusMap.get(attendanceAccrueVO.getEmployeeID());
//				attendanceStatusVO.getAccrues()[i + 1] = attendanceAccrueVO;
//			}
//		}
//		
//		List<AttendanceStatusVO> attendanceStatuses = new ArrayList<>();
//		Iterator<String> iterator = attendanceStatusMap.keySet().iterator();
//		while(iterator.hasNext()) {
//			attendanceStatuses.add(attendanceStatusMap.get(iterator.next()));
//		}
//		
//		log.info("attendanceStatuses : {}", attendanceStatuses);
//	}
}