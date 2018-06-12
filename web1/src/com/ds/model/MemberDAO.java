package com.ds.model;

import java.sql.PreparedStatement;

//회원관련
public class MemberDAO {
	PreparedStatement ps;
	
	public void memberLogin() {

	}

	public boolean memberJoin(String id, String pw, String name, String age, String email1, String email2) {
		try {
			String sql="INSERT INTO V1_MEMBER VALUES(?,?,?,?,?,SYSDATE)";
			
			PreparedStatement ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setInt(4, Integer.parseInt(age));
			ps.setString(5, email1+"@"+email2);
			
			return ps.execute();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return false;
		}
	}

	public void changePassword() {

	}

	public void memberEdit() {

	}


}
