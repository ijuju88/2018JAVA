package com.ds.sts1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

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

	//가입
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

	//로그인
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

				//세션객체 가져옴(로그인 정보 저장...)
				httpsession=request.getSession();
				httpsession.setAttribute("SID", vo1.getMem_id());
				httpsession.setAttribute("SNAME", vo1.getMem_name());

				String backurl=(String)httpsession.getAttribute("BACK_URL");
				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", backurl);
				
				return "alert";
			}
			return "redirect:login.do";

		} catch (Exception e) {
			System.out.println("로그인 컨트롤러 에러 : "+e.getMessage());
			return "redirect:login.do";
		}

	}

	//로그아웃
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
		httpsession.invalidate(); //세션지우기

		request.setAttribute("msg", "로그아웃성공");
		request.setAttribute("url", "home.do");
		return "alert";

	}

	//회원수정
	@RequestMapping(value="edit.do", method= RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) {
		try {
			//회원수정을 위해 세션값불려오기(SID) 
			/*httpsession.getAttribute(");
			 *가 Object 형이라서 String형으로 형변환해서 
			 *가져와야 한다. 
			 * */
			String id=(String) httpsession.getAttribute("SID");

			//id전달되면 한명의 정보 받음
			V1_Member vo=mDAO.selectMemberOne(id);
			request.setAttribute("vo", vo);
			return "edit";
		} catch (Exception e) {
			System.out.println("회원수정 컨트롤러 에러 : "+e.getMessage());
			return "redirect:home.do";
		}

	}

	//회원수정후
	/*
	 * 함수 변수명에 request.getParameter("id") 대신
	 * @RequestParam(value="mem_id", defaultValue="")  String mem_id
	 * 처럼 처리가 가능합니다.
	*/
	@RequestMapping(value="edit.do", method= RequestMethod.POST)
	public String editp(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(value="mem_id", defaultValue="")  String mem_id,
			@RequestParam(value="mem_pw", defaultValue="") String mem_pw,
			@RequestParam(value="mem_name", defaultValue="") String mem_name,
			@RequestParam(value="mem_age", defaultValue="0") int mem_age,
			@RequestParam(value="mem_email", defaultValue="") String mem_email) {
		try {
			V1_Member vo=new V1_Member();
			
			
			
			if(!mem_pw.equals("") && mem_pw!=null) {
				//암호 MD5변경
				mem_pw = EncryptionClass.convertMD5(mem_pw);
				vo.setMem_pw(mem_pw);
				
				vo.setMem_id(mem_id);//기본값
				vo.setMem_name(mem_name);
				vo.setMem_age(mem_age);
				vo.setMem_email(mem_email);
				mDAO.updateMemberOne1(vo);
				
				System.out.println("회원수정값 : "+vo.toString());
				
			}else {
				vo.setMem_id(mem_id);//기본값
				vo.setMem_name(mem_name);
				vo.setMem_age(mem_age);
				vo.setMem_email(mem_email);

				System.out.println("회원수정값1 : "+vo.toString());
				mDAO.updateMemberOne(vo);
			}

	
			
			request.setAttribute("msg", "회원수정성공");
			request.setAttribute("url", "home.do");

			return "alert";

		} catch (Exception e) {
			System.out.println("회원수정후 컨트롤러 에러 : "+e.getMessage());
			return "redirect:edit.do";
		}


	}

}
