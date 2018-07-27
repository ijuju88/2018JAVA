package com.ds.seat.dao;

import org.apache.ibatis.annotations.*;

public interface ShowPriceDAO {

/*	//공연가격저장 / 수정 
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SHOW_PRICE(SHOW_NO,SHOW_VIPPRICE,SHOW_RPRICE,SHOW_SPRICE,SHOW_APRICE)"
			+"VALUES(" + 
			"CAST(#{show_no} AS  signed integer),#{show_vipprice}, #{show_rprice}, "+
			"#{show_sprice},#{show_aprice})"
			+"ON DUPLICATE KEY UPDATE SHOW_NO=CAST(#{show_no} AS  signed integer),"
			+ "SHOW_VIPPRICE=#{show_vipprice}, SHOW_RPRICE=#{show_rprice},"
			+ "SHOW_SPRICE=#{show_sprice}, SHOW_APRICE=#{show_aprice}"})
	public void insertShowPriceOne(Show_Price sVO);


	//공연가격삭제
	@Delete({"DELETE FROM SHOW_PRICE WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void ShowPriceDelete(String show_no);

	//공연정보에 해당되는 가격 불러오기
	@Select({"SELECT * FROM SHOW_PRICE WHERE SHOW_NO=#{show_no}"})
	public Seat_Show_Price_List selectPriceOne(Long show_no);
*/

	//공연정보에 해당되는 특정좌석가격 불러오기
	@Select({"SELECT CASE" + 
			" WHEN #{param1} like 'SHOW_VIPPRICE' THEN SHOW_VIPPRICE"  + 
			" WHEN #{param1} like 'SHOW_RPRICE' THEN SHOW_RPRICE" + 
			" WHEN #{param1} like 'SHOW_SPRICE' THEN SHOW_SPRICE" + 
			" ELSE SHOW_APRICE" + 
			" END PRICE"  + 
			" FROM SHOW_PRICE"  + 
			" WHERE SHOW_NO=#{param2}"})
	public int selectPriceOnechk(String Seats, Long show_no);

}