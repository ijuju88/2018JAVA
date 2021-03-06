package com.ds.seat;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

<<<<<<< HEAD
	@Autowired
	private SeatMemberDAO smDAO;

=======
>>>>>>> refs/remotes/origin/master
	@Autowired
<<<<<<< HEAD
	private SeatShowDAO ssDAO;

=======
	private SeatMemberDAO smDAO;
	
	@Autowired
	private SeatShowDAO ssDAO;
	
>>>>>>> refs/remotes/origin/master

	//관리자 로그인 페이지
	@RequestMapping(value = "adminlogin.do", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}


	//로그인후 관리자 메인페이지
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String adminindex(Model model) {
<<<<<<< HEAD
		int member_num=smDAO.seatSelectMemberNum();
=======
		int member_num=smDAO.seatSelectMemberNumOne();
>>>>>>> refs/remotes/origin/master
		int show_num=ssDAO.selectSeatshowOne();
		model.addAttribute("member_num", member_num);
		model.addAttribute("show_num", show_num);
		return "admin/admin";
	}


	//공연예약페이지
	@RequestMapping(value = "adminshowseat.do", method = RequestMethod.GET)
	public String adminshowseat(Model model) {
<<<<<<< HEAD

=======
		
>>>>>>> refs/remotes/origin/master
		return "admin/showseat/adminshowseat";
	}


	//로그아웃 들어가기
	@RequestMapping(value = "adminlogout.do", method = RequestMethod.GET)
	public String adminLogout(Model model,HttpSession session, HttpServletRequest req) {

		session.invalidate(); //세션값 지우기
		req.setAttribute("msg", "로그아웃성공");
		req.setAttribute("url", "adminlogin.do");


		return "alert";
	}

}

