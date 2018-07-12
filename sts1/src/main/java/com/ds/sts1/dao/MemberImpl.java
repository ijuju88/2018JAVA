package com.ds.sts1.dao;


import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Member;

@Service
public class MemberImpl implements MemberDAO{
	
	@Autowired 
	@Resource(name="sqlSession") 
	private SqlSession sqlSession =null;
	
	//회원가입후 정보 입력하기
	//insert라서 int형
	public int memberJoin(V1_Member vo) {
		/*v1_member.xml에서  
		<mapper namesapce="V1_Member">
		<insert id="memberJoin"....>*/
		return sqlSession.insert("V1_Member.memberJoin", vo);
	
		
	}
	
	public List<V1_Member> selectMemberList(){
		return sqlSession.selectList("V1_Member.selectMemberList");
	}

	//로그인 정보 가져오기
	public V1_Member selectMemberLogin(V1_Member vo) {
		return sqlSession.selectOne("V1_Member.selectMemberLogin",vo);	
	}

	
	//회원수정시 id를 이용해 정보 가져오기
	public V1_Member selectMemberOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Member.selectMemberOne",id);
	}

	//회원수정시 pw값이 없으면
	public int updateMemberOne(V1_Member vo) {
		return sqlSession.update("V1_Member.updateMemberOne",vo);
		
	}
	
	//회원수정시 pw값이 있으면
	public int updateMemberOne1(V1_Member vo) {
		return sqlSession.update("V1_Member.updateMemberOne1",vo);
		
	}

	@Override
	//관리자용 회원수정후
		public int adminMemberUpdateBatch(List<V1_Member> list) {
			return sqlSession.update("V1_Member.AdminupdateMember", list);
		}

	
}
