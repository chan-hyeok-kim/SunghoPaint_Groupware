package com.ham.len.config;

import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import java.util.concurrent.ConcurrentHashMap;

@Component
public class WebSocketSessionPool {
    private final GenericObjectPool<WebSocketSession> sessionPool;
    private final ConcurrentHashMap<String, WebSocketSession> activeSessions = new ConcurrentHashMap<>();

    public WebSocketSessionPool() {
        GenericObjectPoolConfig<WebSocketSession> poolConfig = new GenericObjectPoolConfig<>();
        // 필요한 풀 설정을 추가하세요.
        poolConfig.setMinIdle(10);
        sessionPool = new GenericObjectPool<>(new WebSocketSessionFactory(), poolConfig);
    }

    public WebSocketSession borrowSession() throws Exception {
        WebSocketSession session = sessionPool.borrowObject();
        activeSessions.put(session.getId(), session);
        return session;
    }

    public void returnSession(WebSocketSession session) {
        activeSessions.remove(session.getId());
        sessionPool.returnObject(session);
    }

    public void removeSession(WebSocketSession session) throws Exception {
        activeSessions.remove(session.getId());
        sessionPool.invalidateObject(session);
    }

    public Iterable<WebSocketSession> getActiveSessions() {
        return activeSessions.values();
    }
}
