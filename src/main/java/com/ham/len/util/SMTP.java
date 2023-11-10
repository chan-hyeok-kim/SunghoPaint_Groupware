package com.ham.len.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ham.len.humanresource.HumanResourceVO;

public class SMTP {
	private String user = "a57796682@gmail.com";
	private String password = "cjmy fkhm mrjp wcia";
	
	private MimeMessage msg;
	
	public SMTP() {
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", 465);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		msg = new MimeMessage(session);
	}
	
	public void send_mail(HumanResourceVO humanResourceVO) {
		try {
			msg.setSentDate(new Date()); // 전송 날짜
			msg.setFrom(new InternetAddress(user)); // 보내는 사람
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(humanResourceVO.getEmail())); // 받는 사람
			msg.setSubject("성호 페인트 임시 비밀번호 발급 안내", "UTF-8"); // 제목
			
			// 내용
			String contents = "<div style='display:table; margin:auto; text-align:center;'>" +
										"<img src='https://i.ibb.co/jHbtdR0/logo-clear.png' style='width:150px; margin-bottom:30px;'>" +
										"<table border='1' style='width:200px; height:70px; text-align:center;'>" +
											"<tr>" +
												"<th>사번</th>" +
												"<th>비밀번호</th>" +
											"</tr>" +
											"<tr>" +
												"<td>" + humanResourceVO.getEmployeeID() + "</td>" +
												"<td>" + humanResourceVO.getPassword() + "</td>" +
											"</tr>" +
										"</table>" +
									"</div>";
			
			String type = "text/html; charset=UTF-8";
			msg.setContent(contents, type);
			
			Transport.send(msg); // 전송
		}catch(AddressException addr_e) {
			addr_e.printStackTrace();
		}catch(MessagingException msg_e) {
			msg_e.printStackTrace();
		}
	}
}