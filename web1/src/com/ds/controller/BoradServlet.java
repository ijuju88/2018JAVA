package com.ds.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ds.model.BoardDAO;
import com.ds.vo.V1_Board;

/**
 * Servlet implementation class BoradServlet
 */
@WebServlet("/boardlist.do")
public class BoradServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoradServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			//게시글 페이징 구현을 위한 페이징번호구하기
			String page=request.getParameter("page"); //get으로 파라미터 ?page= 전달
			//System.out.println("page : "+page);

			if(page == null) {
				page="1"; //page=1
			}	
			
			
			//검색관련.....
			String type=request.getParameter("type");
			String text=request.getParameter("text");
			
			
			
			
			String[] str = { "글번호", "제목", "작성자", "조회수", "날짜" };
			request.setAttribute("str", str);


			//C -> V로 전달
			request.setAttribute("aaa", "게시판");


			//Object 보내기

			BoardDAO bDAO=new BoardDAO();
			//String startnum=request.getParameter("startnum");
			/*
			 * List<V1_Board> list=bDAO.selectBoradList();

			//System.out.println(vo.getBrd_no());
			request.setAttribute("list", list);
			 */

			/*
			 * 목록
			 * 1 -> 1 and 10
			 * 2 -> 2 and 20
			 * .....
			 * (page-1)*10+1
			 * */

			if(type == null || text== null) {
				List<V1_Board> list = bDAO.selectBoradList1( (Integer.parseInt(page)-1)*10+1 );
				request.setAttribute("list", list);
			}else if(type != null || text!= null) {
				List<V1_Board> list = bDAO.selectBoradList2( (Integer.parseInt(page)-1)*10+1 , type, text);
				request.setAttribute("list", list);
			}
			
			// 천체 게시물수
			int cnt = bDAO.selectBordadListCount();
			request.setAttribute("cnt", (cnt - 1) / 10 + 1);

			//45 -> (cnt -1)/10+1


			request.getRequestDispatcher("/WEB-INF/boardlist.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("게시판관련에러 : "+e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
