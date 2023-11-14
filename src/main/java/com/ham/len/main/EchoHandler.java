package com.ham.len.main;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private MainDAO mainDAO;
	
	
	public void setAlarmDao(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}

	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//클라이언트가 웹 소켓 생성
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.warn("Socket 연결");
		//웹 소켓이 생성될 때마다 리스트에 넣어줌
		sessions.add(session);
	}
	
	//JS에서 메세지 받을 때.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		 
			 
		for(WebSocketSession single : sessions) {
	
			
				//세션아이디
				String hsid = (String) single.getAttributes().get("user_id");
				
				//세션값이 같을때, 알람보낼 것이 있을 때만 전송 -> 로그인 한 사용자가 처음으로 알람 받는 순간임
				//해당 sendMsg에 DB정보 넣어서 체크 안된 알람 전부 전송하기
				if(single.getAttributes().get("user_id").equals(session.getAttributes().get("user_id"))) {				
					//체크 안된 알림들만 담아서 View
					List<NotificationVO> vo = new ArrayList<>();
					vo = mainDAO.getAlarmList(hsid);
					for(NotificationVO alarm : vo) {
						String contents=alarm.getNotificationContents();
						String title=alarm.getNotificationTitle();
						
						TextMessage sendMsg = new TextMessage("("+title+")"+contents);
						single.sendMessage(sendMsg);
					 }
				  }
			   
		
		
		 }
	}
		 
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.warn("Socket 끊음");
		//웹 소켓이 종료될 때마다 리스트에서 뺀다.
		sessions.remove(session);
	}
}
