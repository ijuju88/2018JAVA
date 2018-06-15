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
 * Servlet implementation class BoardWrite
 */
@WebServlet("/boardwrite.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("title", "글쓰기");
		
		request.getRequestDispatcher("/WEB-INF/boardwrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			//한글처리
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String writer=request.getParameter("writer");
			
			//System.out.println(title+"/"+content+"/"+writer);
			
			//vo생성
			V1_Board vo=new V1_Board();
			vo.setBrd_title(title);
			vo.setBrd_content(content);
			vo.setBrd_writer(writer);
			
			//Model을 통해  DB 값 추가
			BoardDAO bDAO=new BoardDAO();
			bDAO.insertBoard(vo);
			

			response.sendRedirect("boardlist.do");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
