package com.ham.len.main;

import org.springframework.stereotype.Component;

import com.ham.len.humanresource.HumanResourceVO;

@Component
public class AlarmSetting {

	public NotificationVO setApprovalAlarm() {
	     NotificationVO notificationVO=new NotificationVO();
	     
	     notificationVO.setNotificationTitle("승인 완료");
	     notificationVO.setNotificationContents("등록하신 결재가 승인되었습니다");
	
	     return notificationVO;
	}
	
	public NotificationVO setRejectAlarm() {
		 NotificationVO notificationVO=new NotificationVO();
	     
	     notificationVO.setNotificationTitle("반려");
	     notificationVO.setNotificationContents("등록하신 결재가 반려되었습니다");
	
	     return notificationVO;
	}
	
}
