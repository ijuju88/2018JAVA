package com.ds.seat.dao;

import org.apache.ibatis.annotations.*;

import com.ds.seat.vo.Seat_Choice;

public interface SeatChoiceDAO {

	//공연가격저장
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_CHOICE(SHOW_NO)"
			+"VALUES(CAST(#{show_no} AS  signed integer))"})
	public void insertSeatChoiceOne(Long show_no);
	
	
	//좌석정보삭제
	@Delete({"DELETE FROM SEAT_CHOICE WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void SeatChoiceDelete(String show_no);

	//좌석정보불러오기
	@Select({"SELECT * FROM SEAT_CHOICE WHERE SHOW_NO=#{show_no}"})
	public Seat_Choice selectSeatChoiceOne(Long show_no);

}
