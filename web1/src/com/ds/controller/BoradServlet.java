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
		
		String[] str = { "글번호", "제목", "작성자", "조회수", "날짜" };
		request.setAttribute("str", str);
		
		
		//C -> V로 전달
		request.setAttribute("aaa", "게시판");
		
	
		//Object 보내기
		
		BoardDAO bDAO=new BoardDAO();
		List<V1_Board> list=bDAO.selectBoradList();
		
		//System.out.println(vo.getBrd_no());
		request.setAttribute("list", list);
		

		request.getRequestDispatcher("/WEB-INF/boardlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
