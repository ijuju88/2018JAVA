package com.ds.sts1.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_BoardReply;

@Service
public class BoardReployImpl implements BoardReployDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession=null;
	
	//댓글넣기
	@Override
	public int insertBoardReplyOne(V1_BoardReply brVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("V1_BoardReply.inserBoardReplyOne", brVO);
	}

	
	//댓글리스트
	@Override
	public List<V1_BoardReply> selectBoardReplyList(int brd_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("V1_BoardReply.selectBoardReplyList", brd_no);
	}


	//댓글삭제
	@Override
	public int daleteBoardReplyOne(int prl_no) {
		return sqlSession.delete("V1_BoardReply.daleteBoardReplyOne", prl_no);
	}

	
	//게시판 삭제시 댓글삭제
	@Override
	public int daleteBoardReplyOne1(int brd_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("V1_BoardReply.daleteBoardReplyOne1", brd_no);
	}
	

}
