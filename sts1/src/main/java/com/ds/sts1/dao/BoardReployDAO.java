package com.ds.sts1.dao;

import java.util.List;

import com.ds.sts1.vo.V1_BoardReply;


public interface BoardReployDAO {

	public int insertBoardReplyOne(V1_BoardReply brVO);//댓글넣기
	public List<V1_BoardReply> selectBoardReplyList(int brd_no);  //댓글리스트(처음)
	public int daleteBoardReplyOne(int prl_no);//댓글삭제
	public int daleteBoardReplyOne1(int brd_no);//게시판 삭제시 댓글삭제
}
