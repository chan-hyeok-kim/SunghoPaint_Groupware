package com.ham.len.main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.ILoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ham.len.humanresource.HumanResourceVO;

import ch.qos.logback.classic.Logger;
import lombok.extern.slf4j.Slf4j;



@Component
@RequestMapping("/echo/*")
@Slf4j
public class EchoHandler extends TextWebSocketHandler{

	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	 
	@Autowired
	private MainService mainService;
	//private final List<WebSocketSession> sessions = new ArrayList<>();
	
	// 클라이언트가 서버로 연결시
	

	public void setMainDAO(MainService mainService) {
		this.mainService = mainService;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");
			users.put(senderId, session);   // 로그인중 개별유저 저장
		}
	}
	
//	public void notifyClient(String messageContent, WebSocketSession targetSession) throws Exception {
//		List<NotificationVO> notifications = mainService.getAlarmList(targetSession.getAttributes().get("user_id").toString());
//        for (NotificationVO alarm : notifications) {
//            String contents = alarm.getNotificationContents();
//            String title = alarm.getNotificationTitle();
//            TextMessage sendMsg = new TextMessage("("+title+")" + contents);
//            targetSession.sendMessage(sendMsg);
//        }
//	}
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		TextMessage sendMsg1 = new TextMessage("(테스트)" + "성공");
        session.sendMessage(sendMsg1);
		String senderId = getMemberId(session);
		
		log.warn("{}",session.getPrincipal());
		Authentication authentication=(Authentication)session.getPrincipal();
		
		if(authentication==null) {
			log.warn("{}",authentication);
			return;
		}
		
		HumanResourceVO humanResourceVO=(HumanResourceVO)authentication.getPrincipal();
		String username=humanResourceVO.getUsername();
	    List<NotificationVO> notifications = mainService.getAlarmList(username);
	        
	
		if(notifications.size()==0) {
			TextMessage sendMsg = new TextMessage("(테스트)" + "성공");
            session.sendMessage(sendMsg);
		}else {
		for (NotificationVO alarm : notifications) {
		
        	
        	 String contents = alarm.getNotificationContents();
             String title = alarm.getNotificationTitle();
             
         
             TextMessage sendMsg = new TextMessage("("+title+")" + contents);
             session.sendMessage(sendMsg);
             
        }
		}
		

	}
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberId(session);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
			users.remove(session);
		}
	}
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Authentication authentication=(Authentication)session.getPrincipal();
		
		return authentication==null? null: "로그인됨";
	}
}
