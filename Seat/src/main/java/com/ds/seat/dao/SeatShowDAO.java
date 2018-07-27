package com.ds.seat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_Price_List;

public interface SeatShowDAO {

	//공연정보저장 / 수정 
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_SHOW(SHOW_ID, SHOW_NO,SHOW_TITLE,SHOW_CONTENT,SHOW_IMG1,SHOW_IMG2,"
			+ "SHOW_STARTDATE,SHOW_ENDDATE)"
			+"VALUES(CAST(#{show_id} AS  signed integer)," + 
			"CAST(#{show_no} AS  signed integer),#{show_title}, #{show_content}, "+
			"#{show_img1},#{show_img2},"
			+ "DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'), "
			+ "DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s'))"
			+"ON DUPLICATE KEY UPDATE SHOW_ID=CAST(#{show_id} AS  signed integer), "
			+ "SHOW_NO=CAST(#{show_no} AS  signed integer),"
			+ "SHOW_TITLE=#{show_title}, SHOW_CONTENT=#{show_content},"
			+ "SHOW_IMG1=#{show_img1}, "
			+ "SHOW_IMG2=#{show_img2}, "
			+ "SHOW_STARTDATE=DATE_FORMAT(#{show_startdate},'%Y/%m/%d %H:%i:%s'),"
			+ "SHOW_ENDDATE=DATE_FORMAT(#{show_enddate},'%Y/%m/%d %H:%i:%s')"})
	public void insertSeatShowOne(Seat_Show sVO);


	//공연정보List
	@Select({"SELECT SS.SHOW_ID, SH.SHOW_ID_NAME, SS.SHOW_NO, SS.SHOW_TITLE," + 
			"			SS.SHOW_CONTENT, SS.SHOW_IMG1," + 
			"			SS.SHOW_IMG2, SS.SHOW_STARTDATE, " + 
			"			SS.SHOW_ENDDATE, " + 
			"			SP.SHOW_VIPPRICE, SP.SHOW_RPRICE, " + 
			"			SP.SHOW_SPRICE, SP.SHOW_APRICE " + 
			"			FROM SEAT_SHOW SS RIGHT OUTER JOIN " + 
			"			 SHOW_PRICE SP " + 
			"			ON SS.SHOW_NO=SP.SHOW_NO AND SS.SHOW_ENDDATE>=CURDATE()" + 
			"            LEFT JOIN SHOW_HELL SH" + 
	"            ON SS.SHOW_ID=SH.SHOW_ID;"})
	public List<Seat_Show_Price_List> selectSeatshowList();
	
	
	//공연정보1개 정보
		@Select({"SELECT SS.SHOW_ID, SH.SHOW_ID_NAME, SS.SHOW_NO, SS.SHOW_TITLE,  " + 
				"			SS.SHOW_CONTENT, SS.SHOW_IMG1,  " + 
				"			SS.SHOW_IMG2, SS.SHOW_STARTDATE,   " + 
				"			SS.SHOW_ENDDATE,  " + 
				"			SP.SHOW_VIPPRICE, SP.SHOW_RPRICE, " + 
				"			SP.SHOW_SPRICE, SP.SHOW_APRICE "  + 
				"			FROM SEAT_SHOW SS  LEFT OUTER JOIN" + 
				"			SHOW_PRICE SP  " + 
				"			ON SS.SHOW_NO=SP.SHOW_NO" + 
				"			LEFT OUTER JOIN SHOW_HELL SH " + 
				"			ON SS.SHOW_ID=SH.SHOW_ID WHERE SS.SHOW_NO=#{show_no}"})
		public Seat_Show_Price_List selectSeatshowOneData(Long show_no);

	//공연정보삭제시 이미지명 찾기
	@Select({"SELECT * FROM SEAT_SHOW WHERE SHOW_NO=#{show_no}"})
	public Seat_Show selectSeatshow(Long show_no);

	//공연정보삭제
	@Delete({"DELETE FROM SEAT_SHOW WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void seatShowDelete(String show_no);

	//공연등록수(오늘부터~)
	@Select({"SELECT COUNT(*) FROM SEAT_SHOW WHERE SHOW_ENDDATE>=CURDATE()"})
	public int selectSeatshowOne();
}
