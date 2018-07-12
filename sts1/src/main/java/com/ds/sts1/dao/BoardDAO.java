package com.ds.sts1.dao;

import java.util.List;

import com.ds.sts1.vo.V1_Board;

public interface BoardDAO {

	public int BoardInsertNO(); //게시판 쓸때 번호
	public int BoardInsert(V1_Board vo); //게시판 작성
	
	public List<V1_Board> BoardSelectList(); //게시판 리스트

	public V1_Board BoardSelertView(int no); //게시판 글보기
	public int BoardUpHit(int no); //게시판 글조회수증가
	
	public int BoardUpdate(V1_Board vo); //게시판 글수정
	public int BoardDelete(int no); //게시판 글삭제

	public int selectBoardPrevNo(int no);
	public int selectBoardNextNo(int no);
	}
