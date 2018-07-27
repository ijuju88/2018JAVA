package com.ds.seat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_Price_List;

public interface SeatShowDAO {

	//공연정보저장 / 수정 
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_SHOW(SHOW_NO,SHOW_TITLE,SHOW_CONTENT,SHOW_IMG1,SHOW_IMG2,"
			+ "SHOW_STARTDATE,SHOW_ENDDATE)"
			+"VALUES(" + 
			"CAST(#{show_no} AS  signed integer),#{show_title}, #{show_content}, "+
			"#{show_img1},#{show_img2},"
			+ "DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'), "
			+ "DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s'))"
			+"ON DUPLICATE KEY UPDATE SHOW_NO=CAST(#{show_no} AS  signed integer),"
			+ "SHOW_TITLE=#{show_title}, SHOW_CONTENT=#{show_content},"
			+ "SHOW_IMG1=#{show_img1},SHOW_IMG2=#{show_img2}, "
			+ "SHOW_STARTDATE=DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'),"
			+ "SHOW_ENDDATE=DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s')"})
	public void insertSeatShowOne(Seat_Show sVO);
	
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_SHOW(SHOW_NO,SHOW_TITLE,SHOW_CONTENT,"
			+ "SHOW_STARTDATE,SHOW_ENDDATE)"
			+"VALUES(" + 
			"CAST(#{show_no} AS  signed integer),#{show_title}, #{show_content}, "
			+ "DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'), "
			+ "DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s'))"
			+"ON DUPLICATE KEY UPDATE SHOW_NO=CAST(#{show_no} AS  signed integer),"
			+ "SHOW_TITLE=#{show_title}, SHOW_CONTENT=#{show_content},"
			+ "SHOW_STARTDATE=DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'),"
			+ "SHOW_ENDDATE=DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s')"})
	public void insertSeatShowOne2(Seat_Show sVO);
	
	//공연정보List
	@Select({"SELECT SS.SHOW_NO, SS.SHOW_TITLE," + 
			"SS.SHOW_CONTENT, SS.SHOW_IMG1," + 
			"SS.SHOW_IMG2, SS.SHOW_STARTDATE," + 
			"SS.SHOW_ENDDATE," + 
			"SP.SHOW_VIPPRICE, SP.SHOW_RPRICE," + 
			"SP.SHOW_SPRICE, SP.SHOW_APRICE " + 
			"FROM SEAT_SHOW SS RIGHT OUTER JOIN" + 
			" SHOW_PRICE SP " + 
			"ON SS.SHOW_NO=SP.SHOW_NO"})
	public List<Seat_Show_Price_List> selectSeatshowList();
	
	//공연정보삭제시 이미지명 찾기
	@Select({"SELECT * FROM SEAT_SHOW WHERE SHOW_NO=#{show_no}"})
	public Seat_Show selectSeatshowImgs(Long show_no);
	
	//공연정보삭제
	@Delete({"DELETE FROM SEAT_SHOW WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void seatShowDelete(String show_no);


}
