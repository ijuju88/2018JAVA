package com.ds.sts1.dao;


import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Member;


public interface MemberDAO {
	
	//회원가입
	public int memberJoin(V1_Member vo);
	
	//회원정보
	public List<V1_Member> selectMemberList();

	//로그인 정보 가져오기
	public V1_Member selectMemberLogin(V1_Member vo);

	
	//회원수정시 id를 이용해 정보 가져오기
	public V1_Member selectMemberOne(String id) ;

	//회원수정시 pw값이 없으면
	public int updateMemberOne(V1_Member vo);
	
	//회원수정시 pw값이 있으면
	public int updateMemberOne1(V1_Member vo) ;

	//관리자용 회원정보수정(일괄)
	public int adminMemberUpdateBatch(List<V1_Member> list);
}
