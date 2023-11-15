package com.ham.len.main;

import java.util.List;

import org.slf4j.ILoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ham.len.config.WebSocketSessionPool;

import ch.qos.logback.classic.Logger;
import lombok.extern.slf4j.Slf4j;

// ...

@Component
@RequestMapping("/echo")
@Slf4j
public class EchoHandler extends TextWebSocketHandler {

    @Autowired
    private MainDAO mainDAO;

    @Autowired
    private WebSocketSessionPool sessionPool;

   
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.warn("Socket 연결");

        // 세션을 borrow하여 사용
        WebSocketSession pooledSession = sessionPool.borrowSession();
        try {
            // 세션 작업 수행
            handleTextMessageInternal(pooledSession, null);
        } finally {
            // 작업이 끝난 세션을 반환
            sessionPool.returnSession(pooledSession);
        }
    }

    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // WebSocket 세션을 borrow하여 사용
        WebSocketSession pooledSession = sessionPool.borrowSession();
        try {
            // 세션 작업 수행
            handleTextMessageInternal(pooledSession, message);
        } finally {
            // 작업이 끝난 세션을 반환
            sessionPool.returnSession(pooledSession);
        }
    }

    @Async
    public void sendNotificationAsync(WebSocketSession targetSession) {
        try {
            List<NotificationVO> notifications = mainDAO.getAlarmList(targetSession.getAttributes().get("user_id").toString());
            for (NotificationVO alarm : notifications) {
                String contents = alarm.getNotificationContents();
                String title = alarm.getNotificationTitle();
                TextMessage sendMsg = new TextMessage("("+title+")" + contents);
                targetSession.sendMessage(sendMsg);
            }
        } catch (Exception e) {
            // 예외 처리 로직 추가
        }
    }

    private void handleTextMessageInternal(WebSocketSession session, TextMessage message) throws Exception {
        // 원래의 handleTextMessage 로직을 여기에 복사

        for (WebSocketSession single : sessionPool.getActiveSessions()) {
            // 세션 작업 수행
            sendNotificationIfMatchAsync(session, single);
        }
    }

    @Async
    private void sendNotificationIfMatchAsync(WebSocketSession session, WebSocketSession targetSession) {
        if (isMatchingUser(session, targetSession)) {
            sendNotificationAsync(targetSession);
        }
    }

    private boolean isMatchingUser(WebSocketSession session, WebSocketSession targetSession) {
        return targetSession.getAttributes().get("user_id").equals(session.getAttributes().get("user_id"));
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.warn("Socket 끊음");
        // 세션 풀에서 세션 제거
        sessionPool.removeSession(session);
    }
}
