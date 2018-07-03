package com.ds.sts1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MainInterceptor extends HandlerInterceptorAdapter{

	//컨트롤러 진입전 반응하는 함수
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpsession=request.getSession();
		
		///home.do?id=3435
		String path=request.getServletPath();
		
		String query=request.getQueryString();
		
		path=path.substring(1); // / 뺄려고 첫번째 자르기
		
		if(query ==null) {
			httpsession.setAttribute("BACK_URL", path);
			System.out.println("MainInterceptor : "+path+"?"+query);
		}
		else {
			httpsession.setAttribute("BACK_URL", path+"?"+query);
			System.out.println("MainInterceptor!! : "+path+"?"+query);
		}
		
		
		
		return true;
	}

	
}
