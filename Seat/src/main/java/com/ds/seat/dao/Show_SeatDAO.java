package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.Show_Seat;


public interface Show_SeatDAO {

	//공지사항게시판 저장하기
	@Insert({"INSERT INTO SHOW_SEAT "
			+ "(SS_NO, SHOW_NO, SS_SEATTYPE, SS_SEATPAY, SS_SEATROW, SS_SEATCOL) "
			+ "VALUES (#{ss_no}, CAST(#{show_no} AS  signed integer), "
			+ "#{ss_seattype}, #{ss_seatpay}, #{ss_seatrow}, #{ss_seatcol}) "
			+ "ON DUPLICATE KEY UPDATE SS_NO=#{ss_no}, SS_SEATTYPE=#{ss_seattype}, "
			+ "SS_SEATPAY= #{ss_seatpay}, SS_SEATROW=#{ss_seatrow}, SS_SEATCOL=#{ss_seatcol}"})
	public int insertShowSeatOne(Show_Seat nbVO);


	//좌석정보삭제
	@Delete({"DELETE FROM SHOW_SEAT WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void ShowSeatDelete(String show_no);
	
	
	@Select({"SELECT * FROM SHOW_SEAT WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public List<Show_Seat> SelectShowSeatList(Long show_no);

	/*
	//좌석남은갯수 바꾸기(나중에 시간있으면 수정해야함)
	@Update({"UPDATE SHOW_SEAT SET SC_VIPSEAT= " + 
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
	*/
}

