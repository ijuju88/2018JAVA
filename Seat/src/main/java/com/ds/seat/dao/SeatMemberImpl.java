package com.ds.seat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ds.seat.vo.Seat_Member;

@Service
public class SeatMemberImpl implements SeatMemberDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession=null;
	
	//로그인
	@Override
	public Seat_Member seatSelectMemberLogin(Seat_Member vo) {
		return sqlSession.selectOne("seat_member.seatselectmemberlogin",vo);
	}

	//회원리스트
	@Override
	public List<Seat_Member> seatSelectMemberList() {
		return sqlSession.selectList("seat_member.seatselectmemberlist");
	}

	//최근회원수
	@Override
	public int seatSelectMemberNumOne() {
		return sqlSession.selectOne("seat_member.seatselectmembernumone");
	}

}
