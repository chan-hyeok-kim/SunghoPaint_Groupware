package com.ham.len.util;

import java.io.UnsupportedEncodingException;
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

public class SMTP {

	public void welcomeMailSend() {

		Properties prop = System.getProperties();
		
        // 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
        
		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");
        
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
        
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "465");

		Authenticator auth = new MailAuth();

		Session session = Session.getInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());

			// 발송자를 지정한다. 발송자의 메일, 발송자명
			msg.setFrom(new InternetAddress("a57796682@gmail.com", "a57796682@gmail.com"));
			
            // 수신자의 메일을 생성한다.
			InternetAddress to = new InternetAddress("dngu_icdi@naver.com");
			
            // Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
			// 숨은 참조 설정이 가능하다.
			// Message.RecipientType.TO : 받는 사람
			// Message.RecipientType.CC : 참조
			// Message.RecipientType.BCC : 숨은 참조
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // 메일의 제목 지정
			msg.setSubject("환영합니다.", "UTF-8");
			
            // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			msg.setText("가입을 축하드립니다.", "UTF-8");

			Transport.send(msg);

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
}

class MailAuth extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "a57796682@gmail.com";
        String mail_pw = "wasf gbdp urwu suic";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    @Override
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}

//
//public class SMTP {
//	private String from = "a57796682@gmail.com";
//	private MimeMessage msg;
//	
//	public SMTP() {
//		Properties properties = new Properties();
//		properties.put("mail.smtp.starttls.enable", "true"); // Gmail 사용 시 필수 properties
//		properties.put("mail.smtp.host", "smtp.gmail.com"); // Gmail : smtp.gmail.com
//		properties.put("mail.smtp.auth", "true"); // 인증 시도 허용
//		properties.put("mail.smtp.port", "465"); // 네이버 SMTP 포트 번호
//		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//		
//		Authenticator auth = new MyAuthentication();
//		Session session = Session.getInstance(properties, auth); // 인증
//		msg = new MimeMessage(session);
//	}
//	
//	public void send_mail(HumanResourceVO humanResourceVO) {
//		try {
//			msg.setSentDate(new Date()); // 전송 날짜
//			msg.setFrom(new InternetAddress(from)); // 보내는 사람
//			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(humanResourceVO.getEmail())); // 받는 사람
//			msg.setSubject("성호 페인트 임시 비밀번호 발급 안내", "UTF-8"); // 제목
//			
//			// 내용
//			String contents = "<div style='display:table; margin:auto; text-align:center;'>" +
//										"<img src='https://i.ibb.co/jHbtdR0/logo-clear.png' style='width:150px; margin-bottom:30px;'>" +
//										"<table border='1' style='width:200px; height:70px; text-align:center;'>" +
//											"<tr>" +
//												"<th>사번</th>" +
//												"<th>비밀번호</th>" +
//											"</tr>" +
//											"<tr>" +
//												"<td>" + humanResourceVO.getEmployeeID() + "</td>" +
//												"<td>" + humanResourceVO.getPassword() + "</td>" +
//											"</tr>" +
//										"</table>" +
//									"</div>";
//			
//			String type = "text/html; charset=UTF-8";
//			msg.setContent(contents, type);
//			
//			Transport.send(msg); // 전송
//		}catch(AddressException addr_e) {
//			addr_e.printStackTrace();
//		}catch(MessagingException msg_e) {
//			msg_e.printStackTrace();
//		}
//	}
//}
//
//class MyAuthentication extends Authenticator{
//	private PasswordAuthentication account;
//	
//	public MyAuthentication() {
//		String id = "a57796682@gmail.com";
//		String pw = "wasf gbdp urwu suic";
//		
//		account = new PasswordAuthentication(id, pw);
//	}
//	
//	@Override
//	protected PasswordAuthentication getPasswordAuthentication() {
//		return account;
//	}
//}