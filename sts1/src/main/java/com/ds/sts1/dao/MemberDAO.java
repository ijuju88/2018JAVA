package com.ds.sts1.dao;


import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Member;

@Service
public class MemberDAO {
	
	@Autowired 
	@Resource(name="sqlSession") 
	private SqlSession sqlSession =null;
	
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

	public V1_Member selectMemberLogin(V1_Member vo) {
		return sqlSession.selectOne("V1_Member.selectMemberLogin",vo);	
	}
	
}
