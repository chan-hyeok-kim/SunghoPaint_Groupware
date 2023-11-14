package com.ham.len.main;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NotificationVO {

	private Long notificationNo;
	private String employeeID;
	private Date notificationDate;
	private String notificationTitle;
	private String notificationContents;
	
	
}
