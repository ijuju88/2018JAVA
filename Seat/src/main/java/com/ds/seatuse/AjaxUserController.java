package com.ds.seatuse;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.StringTokenizer;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.SeatChoiceDAO;
import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@RestController
@MapperScan({"com.ds.seat.dao"})
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class AjaxUserController {

	@Autowired
	private SeatShowReservationDAO ssrDAO;

	@Autowired
	private SeatChoiceDAO scDAO;
	
	@Autowired
	private SeatMemberDAO smDAO;

	//회원중복확인
	@RequestMapping(value = "idcheck.do", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String m_id) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = smDAO.seatSelectMemberidNum(m_id);
        map.put("cnt", count);
 
        return map;
    }
	
	
	
	//결제하기 
	@RequestMapping(value = "homeshowseatok.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String stepok(Model model,  @RequestParam("ssr_no") int ssr_no,
			@RequestParam("ssr_payset") String ssr_payset) {


		System.out.println("ssr_payset : "+ssr_payset);
		ssrDAO.updteSeatShowReservationOne(ssr_no);

		return null;
	}

	//예약정보삭제
	@RequestMapping(value = "homeshowseatdel.do", method = RequestMethod.GET)
	public void stepdel(Model model, @RequestParam("ssr_no") int ssr_no,
			@RequestParam("show_no") Long show_no) {

		System.out.println("ssr_no : "+ssr_no);

		String ssr_seat=null; //목록받기

		String[] ssr_seat_split=null; //구분자 구분용

		//좌석별 연산용
		int vippricecount=0;
		int rpricecount=0;
		int spricecount=0;
		int apricecount=0;

		ssr_seat=ssrDAO.selectSeatshowReservationSeatList1(show_no);
		//System.out.println("ssr_seat : "+ssr_seat);


		StringTokenizer values = new StringTokenizer(ssr_seat, "," );
		//System.out.println("values : "+values.toString());

		//System.out.println("count : "+values.countTokens()); //자른개수

		ssr_seat_split=ssr_seat.split(",");

		//자른것중 첫글자를 구분해서 좌석수 변화시키기
		for (int i = 0; i < ssr_seat_split.length; i++) {

			if(ssr_seat_split[i].charAt(0) == 'A' || ssr_seat_split[i].charAt(0) == 'B') {

				vippricecount++;
			}else if(ssr_seat_split[i].charAt(0) == 'C' || ssr_seat_split[i].charAt(0) == 'D'  
					|| ssr_seat_split[i].charAt(0) == 'E') {
				rpricecount++;

			}else if(ssr_seat_split[i].charAt(0) == 'F' || ssr_seat_split[i].charAt(0) == 'G'  
					|| ssr_seat_split[i].charAt(0) == 'H') {

				spricecount++;
			}else if(ssr_seat_split[i].charAt(0) == 'I' || ssr_seat_split[i].charAt(0) == 'J'  || 
					ssr_seat_split[i].charAt(0) == 'K' || ssr_seat_split[i].charAt(0) == 'L') {
				apricecount++;
			}

		}
		
		System.out.println("seatcount : "+vippricecount+"/"+rpricecount+"/"+spricecount+"/"+apricecount);
		scDAO.updatePlusSeatVIPChoice(vippricecount, show_no);
		scDAO.updatePlusSeatRChoice(rpricecount, show_no);
		scDAO.updatePlusSeatSChoice(spricecount, show_no);
		scDAO.updatePlusSeatAChoice(apricecount, show_no);
		
		//좌석수 초기화(다음을 위한)
		vippricecount=0;
		rpricecount=0;
		spricecount=0;
		apricecount=0;

		ssrDAO.deleteSeatshowReservation(ssr_no);
	}
}
