package com.ds.seat.dao;

import java.util.List;

import com.ds.seat.vo.V1_Member;

public interface MemberDAO {

	public V1_Member selectMemberLogin(V1_Member vo); //로그인 정보
	public List<V1_Member> selectMemberList(); //회원리스트
}
