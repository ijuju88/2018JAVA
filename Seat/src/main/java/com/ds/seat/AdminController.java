package com.ds.seat;

import java.io.Console;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.seat.dao.TestImpl;
import com.ds.seat.vo.V1_Member;
import com.ds.seat.vo.V1_Test;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@Autowired
	private RedisTemplate<String, String> strTemplate=null;
	
	//DAO호출
	@Autowired
	private TestImpl tDAO=null;

	//관리자 로그인 페이지
	@RequestMapping(value = "adminlogin.do", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}


	//로그인후 관리자 메인페이지
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String adminindex(Locale locale, Model model) {
		
		String id=strTemplate.opsForValue().get("SID");
		model.addAttribute("SID", id);
		return "admin/admin";
	}

}

