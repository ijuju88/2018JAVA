package com.ds.seat.dao;

import org.apache.ibatis.annotations.*;

public interface SeatChoiceDAO {

	//공연가격저장
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_CHOICE(SHOW_NO)"
			+"VALUES(CAST(#{show_no} AS  signed integer))"
			+" ON DUPLICATE KEY UPDATE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void insertSeatChoiceOne(Long show_no);
	
	//좌석정보삭제
	@Delete({"DELETE FROM SEAT_CHOICE WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void SeatChoiceDelete(String show_no);

/*	//좌석정보불러오기
	@Select({"SELECT * FROM SEAT_CHOICE WHERE SHOW_NO=#{show_no}"})
	public Seat_Choice selectSeatChoiceOne(Long show_no);*/
	
	//좌석남은갯수 바꾸기(나중에 시간있으면 수정해야함)
	@Update({"UPDATE seat_choice SET SC_VIPSEAT= " + 
			"(SELECT SC_VIPSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})- " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updateMinusSeatVIPChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_RSEAT= " + 
			"(SELECT SC_RSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})- " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updateMinusSeatRChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_SSEAT= " + 
			"(SELECT SC_SSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})- " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updateMinusSeatSChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_ASEAT= " + 
			"(SELECT SC_ASEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})- " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updateMinusSeatAChoice(int count ,Long show_no);

	
	//삭제후 좌석수 추가
	@Update({"UPDATE seat_choice SET SC_VIPSEAT= " + 
			"(SELECT SC_VIPSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})+ " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updatePlusSeatVIPChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_RSEAT= " + 
			"(SELECT SC_RSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})+ " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updatePlusSeatRChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_SSEAT= " + 
			"(SELECT SC_SSEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})+ " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updatePlusSeatSChoice(int count ,Long show_no);
	
	@Update({"UPDATE seat_choice SET SC_ASEAT= " + 
			"(SELECT SC_ASEAT " + 
			"FROM SEAT_CHOICE " + 
			"WHERE SHOW_NO=#{param2})+ " + 
			"#{param1} WHERE SHOW_NO=#{param2}"})
	public void updatePlusSeatAChoice(int count ,Long show_no);
}
