package com.ds.restcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ds.model.BoardDAO;
import com.ds.vo.V1_Board;

/**
 * Servlet implementation class AjaxBoardServlet
 */
@WebServlet("/ajaxboarddone.do")
public class AjaxBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxBoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			//한글처리
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String no=request.getParameter("no");

			BoardDAO bDAO=new BoardDAO();
			V1_Board vo=bDAO.selectBoradView(Integer.parseInt(no));

			JSONObject jobj= new JSONObject();

			//{'brd_no':33}
			jobj.put("brd_no", vo.getBrd_no());
			jobj.put("brd_title", vo.getBrd_title());
			jobj.put("brd_content", vo.getBrd_content());
			jobj.put("brd_writer", vo.getBrd_writer());
			jobj.put("brd_hit1", vo.getBrd_hit1());
			jobj.put("brd_file", vo.getBrd_file());
			jobj.put("brd_date", vo.getBrd_date());
			
			System.out.println("ajax확인 : "+vo.getBrd_hit1());

			//출력
			PrintWriter out=response.getWriter();
			out.print(jobj.toString());

		} catch (Exception e) {
			System.out.println("수정ajax 에러 : "+e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
