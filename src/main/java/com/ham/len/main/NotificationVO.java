package com.ham.len.main;

import java.util.Date;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;

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
