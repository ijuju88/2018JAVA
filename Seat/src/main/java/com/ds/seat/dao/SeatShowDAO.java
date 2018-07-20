package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.ds.seat.vo.Seat_Show;

public interface SeatShowDAO {

	//공연정보저장 / 수정 
	@Insert({"INSERT INTO SEAT_SHOW(SHOW_NO,SHOW_TITLE,SHOW_CONTENT,SHOW_STARTDATE,SHOW_ENDDATE)"
			+"VALUES(" + 
			"CAST(#{show_no} AS  signed integer),#{show_title}, #{show_content}, "
			+ "DATE_FORMAT(#{show_startdate},'%Y/%m/%d %h:%i:%s'), "
			+ "DATE_FORMAT(#{show_enddate},'%Y/%m/%d %h:%i:%s'))"
			+"ON DUPLICATE KEY UPDATE SHOW_NO=CAST(#{show_no} AS  signed integer),"
			+ "SHOW_TITLE=#{show_title}, SHOW_CONTENT=#{show_content},"
			+ "SHOW_STARTDATE=DATE_FORMAT(#{show_startdate},'%Y/%m/%d %h:%i:%s'),"
			+ "SHOW_ENDDATE=DATE_FORMAT(#{show_enddate},'%Y/%m/%d %h:%i:%s')"})
	public void insertSeatShowOne(Seat_Show sVO);
	
	//공연정보List
	@Select({"SELECT * FROM SEAT_SHOW"})
	public List<Seat_Show> selectSeatshowList();
	
	
	//공연정보삭제
	@Delete({"DELETE FROM SEAT_SHOW WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void seatSelectMemberDelete(String show_no);

}
