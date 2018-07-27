package com.ds.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ds.model.BoardDAO;
import com.ds.vo.V1_Board;

/**
 * Servlet implementation class BoradViewServlet
 */
@WebServlet("/boardview.do")
public class BoradViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoradViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		PrintWriter print=response.getWriter();
		
		request.setAttribute("title", "글보기");

		//boardview.do?no=?
		String no=request.getParameter("no");

		//Object 보내기
		BoardDAO bDAO=new BoardDAO();
		V1_Board vo= bDAO.selectBoradView(Integer.parseInt(no));

		request.setAttribute("vo", vo);
		System.out.println(vo.getBrd_file());
		
		//이전페이지 주소
		String page=request.getHeader("referer");
		if(page ==null || !page.equals("boardlist.do")) {
			print.println("<script>alert('잘못된접근');</script>");
			return null;
		}else {
			//이전글
			int pno=bDAO.prevBoardNo(Integer.parseInt(no));
			request.setAttribute("pno", pno);

			//다음글
			int nno=bDAO.nextBoardNo(Integer.parseInt(no));
			request.setAttribute("nno", nno);
			
			request.getRequestDispatcher("/WEB-INF/boardview.jsp").forward(request, response);

		}

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
