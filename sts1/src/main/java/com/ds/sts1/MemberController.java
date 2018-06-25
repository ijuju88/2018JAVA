package com.ds.sts1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.ds.sts1.dao.MemberDAO;
import com.ds.sts1.func.EncryptionClass;
import com.ds.sts1.vo.V1_Member;

@Controller
public class MemberController {
	
	@Autowired 
	private MemberDAO mDAO=null;
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)
	private String join(HttpServletRequest request, HttpServletResponse response) {
		return "join"; //join.jsp표시
		//request.getRequestDispatcher("/WEB_INF/join.jsp").forward(request,response);

	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	private String joinp(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String email=request.getParameter("email");
		
		//입력한 암호 전달(암호화)
		pw=EncryptionClass.convertMD5(pw);
				
		V1_Member vo=new V1_Member();
		vo.setMem_id(id);
		vo.setMem_pw(pw);
		vo.setMem_name(name);
		vo.setMem_age(Integer.parseInt(age));
		vo.setMem_email(email);
		
		
		mDAO.memberJoin(vo);
		
		System.out.println(id+"/"+pw+"/"+name);
		return "redirect:join.do";
		//response.sendRedirect("/");

	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	private String login() {
		return "login";

	}
}
