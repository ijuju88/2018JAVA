package com.ds.sts1.dao;


import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
