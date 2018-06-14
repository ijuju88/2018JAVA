package com.ds.model;

import java.sql.*;

import com.ds.vo.V1_Member;

//회원관련
public class MemberDAO {
	PreparedStatement ps;

	public V1_Member memberLogin(String id, String pw) {
		try {
			
			// SELECT * FROM 테이블명 WHERE 조건
			String sql = "SELECT * FROM V1_MEMBER " + " WHERE MEM_ID=? AND MEM_PW=?";
			ps = OracleConnStatic.getConn().prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);

			
			// int ret = insert, update, delete => ps.executeUpdate()
			ResultSet rs = ps.executeQuery(); // SELECT일경우
			
			if (rs.next()) { // SELECT를 통해 반환된 값이 있느냐?
				V1_Member vo = new V1_Member();
				vo.setMem_id(rs.getString("MEM_ID"));
				vo.setMem_name(rs.getString("MEM_NAME"));
				vo.setMem_age(rs.getInt("MEM_AGE"));
				vo.setMem_email(rs.getString("MEM_EMAIL"));
				return vo;
			}
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}


public int memberJoin(String id, String pw, String name, String age, String email1, String email2) {
	try {
		String sql="INSERT INTO V1_MEMBER VALUES(?,?,?,?,?,SYSDATE)";

		ps=OracleConnStatic.getConn().prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ps.setString(3, name);
		ps.setInt(4, Integer.parseInt(age));
		ps.setString(5, email1+"@"+email2);

		return ps.executeUpdate();


	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
		return 0;
	}
}

public void changePassword() {

}

public void memberEdit() {

}


}
