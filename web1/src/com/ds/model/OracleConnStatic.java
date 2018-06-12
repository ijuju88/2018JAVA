package com.ds.model;

import java.sql.*;

public class OracleConnStatic {
	
	public static Connection getConn() {
		try {
			//1.드라이버 설치 jdbc드라이버 설치 완료후
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2.DB접속(서버주소, 아이디,비번)
			Connection conn = DriverManager.getConnection(Config.dburl, Config.dbid, Config.dbpw);

			if(conn != null) {
				System.out.println("오라클 접속 성공");
				return conn;
			}
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("오라클 접속 실패");
			return null;
		}
		return null;
		
	}
}
