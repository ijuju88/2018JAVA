package com.ds.sts1.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketServer extends TextWebSocketHandler{
	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();

	//사용자 나감

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("사용자 확인(퇴장) : "+session.getId());
		list.remove(session);//list변수에 사용자 삭제
		
	}

	//사용자 들어옴
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		list.add(session); //list변수에 사용자 추가
		System.out.println("사용자 확인(입장) : "+session.getId());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		String msg=message.getPayload().toString(); //서버에 전달된 메세지
		System.out.println(session.getId()+"님으로부터 (" + msg + ")받음");
		
		for (WebSocketSession tmp : list) {
			tmp.sendMessage(message);
			
		}
	}

	
	
}
