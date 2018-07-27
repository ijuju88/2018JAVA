package com.ds.seatuse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.vo.Seat_Member;
import com.ds.seat.vo.Seat_Member_Reservation;
@Controller
public class UseMemberController {

	@Autowired
	private SeatMemberDAO smDAO;

	@Autowired
	private SeatShowReservationDAO ssrDAO;

	//로그인하기
	//참고 
	@RequestMapping(value = "homelogin.do", method = RequestMethod.POST)
	public String homeLoginPOST(Model model,@RequestParam("id") String id, @RequestParam("pw") String pw,
			HttpServletRequest request, HttpSession httpsession) {

		Seat_Member vo=new Seat_Member();

		//로그인전 혹시모를 세션 지우기
		httpsession.invalidate();

		System.out.println("아이디값? : "+id);
		System.out.println("비번값? : "+pw);

		vo.setM_id(id);
		vo.setM_pw(pw);

		try {
			Seat_Member vo1=smDAO.seatSelectMemberLoginUse(vo);

			if(vo1!=null) {

				//세션객체 가져옴(로그인 정보 저장...)
				httpsession=request.getSession();
				httpsession.setAttribute("USESID", vo1.getM_id());
				httpsession.setAttribute("USENAME", vo1.getM_pw());

				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", "home.do");


				return "alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:home.do";
		}
		return "redirect:home.do";
	}


	//Mypage 들어가기(예약현황)
	@RequestMapping(value = "homeMyPage1.do", method = RequestMethod.GET)
	public String homeMyPage1GET(Model model,HttpSession session, HttpServletRequest req) {

		List<Seat_Member_Reservation> list = new ArrayList<Seat_Member_Reservation>();

		//id 알아내기
		String m_id=(String)session.getAttribute("USESID");
		list=ssrDAO.selectUseSeatshowReservationSeat(m_id);

		model.addAttribute("list",list);
		return "use/mypage/mypage1";
	}


	//Mypage 들어가기()
	@RequestMapping(value = "homeMyPage3.do", method = RequestMethod.GET)
	public String homeMyPage3GET(Model model,HttpSession session, HttpServletRequest req) {

		return "use/mypage/mypage3";
	}


	//로그아웃 들어가기
	@RequestMapping(value = "homelogout.do", method = RequestMethod.GET)
	public String homeLogoutGET(Model model,HttpSession session, HttpServletRequest req) {

		session.invalidate(); //세션값 지우기
		req.setAttribute("msg", "로그아웃성공");
		req.setAttribute("url", "home.do");


		return "alert";
	}


}

