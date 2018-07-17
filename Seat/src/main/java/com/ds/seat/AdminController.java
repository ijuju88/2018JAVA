package com.ds.seat;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ds.seat.dao.SeatMemberImpl;
import com.ds.seat.vo.Seat_Member;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	/*@Autowired
	private RedisTemplate<String, String> strTemplate=null;*/
	
	@Autowired
	private SeatMemberImpl smDAO;
	

	//관리자 로그인 페이지
	@RequestMapping(value = "adminlogin.do", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}


	//로그인후 관리자 메인페이지
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String adminindex(Model model) {
		int member_num=smDAO.seatSelectMemberNumOne();
		model.addAttribute("member_num", member_num);
		return "admin/admin";
	}
	
	
	//좌석예약페이지
		@RequestMapping(value = "adminshowseat.do", method = RequestMethod.GET)
		public String adminshowseat(Model model) {
			return "admin/adminshowseat";
		}

}

