package com.ds.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ds.model.MemberDAO;

/**
 * Servlet implementation class JoinServlet
 */

//매칭할 주소
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //html에서 form method="get"일때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//값 전달
		request.setAttribute("title", "회원가입!!");
		request.setAttribute("num", 123);	
		
		
		//jsp화면표시
		request.getRequestDispatcher("/WEB-INF/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	 //html에서 form method="Post"일때
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//jsp에서 전달되는 값 받기
		String id=request.getParameter("joinId");
		String pw=request.getParameter("joinPw1");
		String name=request.getParameter("joinName");
		String age=request.getParameter("joinAge");
		String email1=request.getParameter("joinEmail1");
		String email2=request.getParameter("joinEmail2");
		
		System.out.println(id+"/"+pw+"/"+name+"/"+age+"/"+email1+"/"+email2);
		
		//Model을 통해  DB 값 추가
		MemberDAO obj=new MemberDAO();
		int ret = obj.memberJoin(id,pw,name,age,email1, email2);
		
		//System.out.println(ret);
		
		if(ret!=0) {
			//사용자에게 보여줄 페이지 전환
			PrintWriter out=response.getWriter();
			response.setContentType("text/html; character=UTF-8");
			
			out.println("<script>"
					+ "alert('회원가입완료');"
					+"location.href='index.do';"
					+"</script>");
			
			//response.sendRedirect("index.do");
		}else {
			response.sendRedirect("join.do");
		}
		
		
	}

}
