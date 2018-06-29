package com.ds.sts1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		request.setAttribute("msg", "회원가입성공");
		request.setAttribute("url", "home.do");
		
		return "alert";
		//response.sendRedirect("/");

	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	private String login() {
		return "login";

	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	private String login(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
		V1_Member vo=new V1_Member();
		
		String id=request.getParameter("id");
		
		//암호 MD5변경
		String pw = EncryptionClass.convertMD5(request.getParameter("pw"));
		System.out.println("아이디값? : "+id);
		System.out.println("비번값? : "+pw);
		vo.setMem_id(request.getParameter("id"));
		vo.setMem_pw(pw);
		try {
			V1_Member vo1=mDAO.selectMemberLogin(vo);
			if(vo1!=null) {
				
				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", "home.do");
				//세션객체 가져옴(로그인 정보 저장...)
				httpsession=request.getSession();
				httpsession.setAttribute("SID", vo1.getMem_id());
				httpsession.setAttribute("SNAME", vo1.getMem_name());
				
				return "alert";
			}
			return "redirect:login.do";
			
		} catch (Exception e) {
			System.out.println("로그인 컨트롤러 에러 : "+e.getMessage());
			return "redirect:login.do";
		}

	}
	
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
		httpsession.invalidate(); //세션지우기
		
		request.setAttribute("msg", "로그아웃성공");
		request.setAttribute("url", "home.do");
		return "alert";
		
	}
	
	
	@RequestMapping(value="edit.do", method= RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
		
		return "edit";
		
	}
	
}
