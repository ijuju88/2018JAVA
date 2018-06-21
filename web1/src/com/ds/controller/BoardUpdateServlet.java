package com.ds.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ds.model.BoardDAO;
import com.ds.vo.V1_Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boarupdate.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int maxSize=1024*1024*10;
			String path=request.getSession().getServletContext().getRealPath("/");
			
			MultipartRequest muti=new MultipartRequest
					(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
			
			String brd_no=muti.getParameter("no");
			String brd_title=muti.getParameter("brd_title");
			String brd_content=muti.getParameter("brd_content");
			String brd_writer=muti.getParameter("brd_writer");
			String brd_file=muti.getFilesystemName("brd_file");
			
			System.out.println("업데이트 확인 : "+brd_no+"/"+brd_title+"/"+brd_content);
			System.out.println("업데이트 확인 : "+brd_writer+"/"+brd_file);
			
			V1_Board vo=new V1_Board(Integer.parseInt(brd_no), brd_title, brd_writer, brd_content, brd_file);
			
			BoardDAO dDAO=new BoardDAO();
			dDAO.boardUpdate(vo);
			response.sendRedirect("boardview.do?no="+brd_no);
			
		} catch (Exception e) {
			System.out.println("업데이트 에러 : "+e.getMessage());
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
