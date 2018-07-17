package com.ds.seat.dao;

import java.util.List;

import com.ds.seat.vo.Seat_Member;

public interface SeatMemberDAO {

	public Seat_Member seatSelectMemberLogin(Seat_Member vo); //로그인 정보
	public List<Seat_Member> seatSelectMemberList(); //회원리스트
	public int seatSelectMemberNumOne(); //최근회원수
}
