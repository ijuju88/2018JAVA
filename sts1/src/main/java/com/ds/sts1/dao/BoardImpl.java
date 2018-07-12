package com.ds.sts1.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Board;

@Service
public class BoardImpl implements BoardDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession = null;

	//게시판 글넣기
	public int BoardInsert(V1_Board vo) {
		return sqlSession.insert("V1_Board.boardinsert", vo);
	}

	//게시판 글넣기 - 마지막글번호
	public int BoardInsertNO() {
		return sqlSession.selectOne("V1_Board.boardno");
	}

	//게시판 삭제
	@Override
	public int BoardDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("V1_Board.boarddelete", no);
	}

	//게시판 리스트
	@Override
	public List<V1_Board> BoardSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("V1_Board.boardlist");
	}

	
	//게시판 글보기
	@Override
	public V1_Board BoardSelertView(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Board.boardlistview", no);
	}

	//게시판 글수정
	@Override
	public int BoardUpdate(V1_Board vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("V1_Board.boardlistupdate",vo);
	}

	//hit증가
	@Override
	public int BoardUpHit(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update("V1_Board.boardlistuphit", no);
	}

	//이전글
	@Override
	public int selectBoardPrevNo(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Board.boardprevno", no);
	}

	//다음글
	@Override
	public int selectBoardNextNo(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Board.boardnextno", no);
	}
}
