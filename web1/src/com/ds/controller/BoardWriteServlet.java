package com.ds.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.coyote.Request;

import com.ds.model.BoardDAO;
import com.ds.vo.V1_Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");


		request.setAttribute("title", "글쓰기");

		HttpSession httpsession=request.getSession();
		String sid=(String)httpsession.getAttribute("SID");


		if(sid == null || sid.equals("")) {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html; character=UTF-8");

			out.println("<script>"
					+ "alert('아이디 입력해주세요 찡끗 >_O');"
					+"location.href='boardlist.do';"
					+"</script>");
		}else
		{
			request.getRequestDispatcher("/WEB-INF/boardwrite.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try {
			//한글처리
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			//파일첨부

			//최대용량
			int maxSize=1024 * 1024 * 5; 

			//저장위치
			String root=request.getSession()
					.getServletContext()
					.getRealPath("/");

			//request를 MultipartRequest로 변경
			MultipartRequest multi=new MultipartRequest
					(request, root,maxSize,"UTF-8",new  DefaultFileRenamePolicy());

			System.out.println(root);


			//기종의 request를 multi로 바꾼다
			String title=multi.getParameter("title");
			String content=multi.getParameter("content");
			String writer=multi.getParameter("writer");
			String filename=multi.getFilesystemName("img");
			//System.out.println(title+"/"+content+"/"+writer);


			//vo생성
			V1_Board vo=new V1_Board();
			vo.setBrd_title(title);
			vo.setBrd_content(content);
			vo.setBrd_writer(writer);
			//vo.setBrd_img();
			vo.setBrd_file(filename);

			//Model을 통해  DB 값 추가
			BoardDAO bDAO=new BoardDAO();
			bDAO.insertBoard(vo);


			response.sendRedirect("boardlist.do");


		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
