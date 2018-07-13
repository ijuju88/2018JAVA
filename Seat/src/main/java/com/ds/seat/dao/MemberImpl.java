package com.ds.seat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.seat.vo.V1_Member;

@Service
public class MemberImpl implements MemberDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession=null;
	
	//로그인
	@Override
	public V1_Member selectMemberLogin(V1_Member vo) {
		return sqlSession.selectOne("v1_member.selectmemberlogin",vo);
	}

	//회원리스트
	@Override
	public List<V1_Member> selectMemberList() {
		return sqlSession.selectList("v1_member.selectmemberlist");
	}

}
