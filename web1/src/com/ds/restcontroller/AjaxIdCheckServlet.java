package com.ds.restcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ds.model.MemberDAO;

@WebServlet("/ajaxidcheck.do")
public class AjaxIdCheckServlet extends HttpServlet{


	private static final long serialVersionUID = 1L;

	public AjaxIdCheckServlet() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//이대로 하면 아이디 노출됨
			String id=req.getParameter("Id");
			PrintWriter out=resp.getWriter();
			//out.print("id : "+id);
			
			
			MemberDAO mDAO=new MemberDAO();
			int ret=mDAO.memberIDCheck(id);
			
			//json 사용해보기
			//{"ret",'y'/'n'}
			JSONObject jobj=new JSONObject();
			jobj.put("ret", "n"); //디폴트값 
			
			if(ret == 0) {
				jobj.put("ret", "y");
			}
			
			
			out.print(jobj.toString());
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
