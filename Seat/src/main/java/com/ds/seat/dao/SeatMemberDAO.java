package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ds.seat.vo.Seat_Member;

public interface SeatMemberDAO {

	@Select({"SELECT * FROM  SEAT_MEMBER WHERE M_ID=#{m_id} and "
			+ "M_PW=#{m_pw} and M_RETING=0 "})
	public Seat_Member seatSelectMemberLogin(Seat_Member vo); //로그인 정보
	
	@Select({"SELECT * FROM SEAT_MEMBER ORDER BY M_NO DESC"})
	public List<Seat_Member> seatSelectMemberList(); //회원리스트
	
	@Select({"SELECT COUNT(*) FROM  SEAT_MEMBER WHERE M_DATE>= "
			+ "date_add(now(), interval -7 day) "})
	public int seatSelectMemberNumOne(); //최근회원수
}
