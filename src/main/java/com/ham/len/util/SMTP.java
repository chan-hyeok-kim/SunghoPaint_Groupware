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
	private String from = "plz_reply@naver.com"; 
	private MimeMessage msg;
	
	public SMTP() {
		Properties properties = new Properties();
		// properties.put("mail.smtp.starttls.enable", "true"); // Gmail 사용 시 필수 properties
		properties.put("mail.smtp.host", "smtp.naver.com"); // Gmail : smtp.gmail.com
		properties.put("mail.smtp.auth", "true"); // 인증 시도 허용
		properties.put("mail.smtp.port", "587"); // 네이버 SMTP 포트 번호
		
		Authenticator auth = new MyAuthentication();
		Session session = Session.getInstance(properties, auth); // 인증
		msg = new MimeMessage(session);
	}
	
	public void send_mail(HumanResourceVO humanResourceVO) {
		try {
			msg.setSentDate(new Date()); // 전송 날짜
			msg.setFrom(new InternetAddress(from)); // 보내는 사람
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

class MyAuthentication extends Authenticator{
	private PasswordAuthentication account;
	
	public MyAuthentication() {
		String id = "plz_reply";
		String pw = "MJ1159029?";
		
		account = new PasswordAuthentication(id, pw);
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return account;
	}
}