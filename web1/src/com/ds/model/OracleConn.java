package com.ds.model;

import java.sql.*;


public class OracleConn {
	
	//Getter/Setter 이용
	private Connection conn=null;
	
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public OracleConn() {
		try {
			//1.드라이버 설치 jdbc드라이버 설치 완료후
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2.DB접속(서버주소, 아이디,비번)
			conn = DriverManager.getConnection(Config.dburl, Config.dbid, Config.dbpw);

			if(conn != null) {
				System.out.println("오라클 접속 성공");
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("오라클 접속 실패");
		}
	}
	
}
