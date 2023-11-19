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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	

	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	
		Authentication authentication=(Authentication)session.getPrincipal();
		
		if(authentication==null) {
			return;
		}
		
		String msg=message.getPayload();
		if (msg == null || msg.length()==0) {
	        return;
	    }
		 
		  
		if(msg!=null) {
		   String[] strs=msg.split(",");
		   
		   if(strs!=null && strs.length==4) {
			   String title=strs[0];
			   String contents=strs[1];
			   String time=strs[2];
			   String no=strs[3];
			   
			   TextMessage sendMsg = new TextMessage(title+":"+contents+":"+no);
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
