package com.ds.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ds.model.MemberDAO;
import com.ds.vo.V1_Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		//jsp에서 전달되는 값 받기
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		//Model을 통해  DB 값 추가
		MemberDAO obj=new MemberDAO();
		V1_Member vo =obj.memberLogin(id,pw);
		
		System.out.println("로그인값:"+id+"/"+pw);
		
		//사용자에게 보여줄 페이지 전환
		//response.sendRedirect("index.do");
		
		if(vo!= null) {
			//사용자에게 보여줄 페이지 전환
			
			/*PrintWriter out=response.getWriter();
			response.setContentType("text/html; character=UTF-8");
			
			out.println("<script>"
					+ "alert('환영합니다.');"
					+"location.href='index.do';"
					+"</script>");*/
			
			//세션객체 가져옴(로그인 정보 저장...)
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("SID", vo.getMem_id());
			httpsession.setAttribute("SNAME", vo.getMem_name());
			
			response.sendRedirect("index.do");
		}else {
			
			PrintWriter out=response.getWriter();
			response.setContentType("text/html; character=UTF-8");
			
			out.println("<script>"
					+ "alert('아이디 또는 비번이 잘못되었습니다');"
					+"location.href='login.do';"
					+"</script>");
		}
	}

}
