package com.ds.seat;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.seat.dao.MemberImpl;
import com.ds.seat.dao.TestImpl;
import com.ds.seat.vo.V1_Member;
import com.ds.seat.vo.V1_Test;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//DAO호출
	@Autowired
	private MemberImpl mDAO=null;

	@RequestMapping(value = "adminlogin.do", method = RequestMethod.POST)
	public String adminloginchk(Locale locale, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
			
		V1_Member vo=new V1_Member();
		String id=request.getParameter("admin_id");
		String pw=request.getParameter("admin_pw");
		//암호 MD5변경
		//String pw = EncryptionClass.convertMD5(request.getParameter("pw"));
		
		System.out.println("아이디값? : "+id);
		System.out.println("비번값? : "+pw);
			vo.setM_id(id);
			vo.setM_pw(pw);
			try {
				V1_Member vo1=mDAO.selectMemberLogin(vo);
				if(vo1!=null) {

					//세션객체 가져옴(로그인 정보 저장...)
					httpsession=request.getSession();
					httpsession.setAttribute("SID", vo1.getM_id());
					httpsession.setAttribute("SNAME", vo1.getM_pw());

				
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

}

