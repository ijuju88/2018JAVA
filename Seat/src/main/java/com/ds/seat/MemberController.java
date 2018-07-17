package com.ds.seat;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ds.seat.dao.SeatMemberImpl;
import com.ds.seat.vo.Seat_Member;

@Controller
public class MemberController {
	
	/* @Autowired
	 private RedisTemplate<String, String> strTemplate;*/
	
	//DAO호출
	@Autowired
	private SeatMemberImpl smDAO=null;

	//관리자 로그인후
	@RequestMapping(value = "adminlogin.do", method = RequestMethod.POST)
	public String adminloginchk(Locale locale, Model model, 
			@RequestParam("admin_id") String id,   @RequestParam("admin_pw") String pw,
			HttpServletRequest request, HttpSession httpsession) {
			
		Seat_Member vo=new Seat_Member();
		//암호 MD5변경
		//String pw = EncryptionClass.convertMD5(request.getParameter("pw"));
		
		System.out.println("아이디값? : "+id);
		System.out.println("비번값? : "+pw);
			
		vo.setM_id(id);
		vo.setM_pw(pw);
		
			try {
				Seat_Member vo1=smDAO.seatSelectMemberLogin(vo);
				if(vo1!=null) {

					//세션객체 가져옴(로그인 정보 저장...)
					httpsession=request.getSession();
					httpsession.setAttribute("SID", vo1.getM_id());
					httpsession.setAttribute("SNAME", vo1.getM_pw());
					
				/*	strTemplate.opsForValue().set("SID", id);
					strTemplate.opsForValue().set("SNAME", vo1.getM_name());*/
				
					request.setAttribute("msg", "로그인성공");
					request.setAttribute("url", "admin.do");
					

					return "alert";
				}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:adminlogin.do";
		}
			return "redirect:adminlogin.do";
			
	}
	
	//관리자 회원리스트
	@RequestMapping(value = "adminmember.do", method = RequestMethod.GET)
	public String adminMember(Model model) {
		try {
			List<Seat_Member> list=smDAO.seatSelectMemberList();
			model.addAttribute("Memberlist", list);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "admin/adminmember";
	}

}

