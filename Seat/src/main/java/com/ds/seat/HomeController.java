package com.ds.seat;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ds.seat.dao.TestImpl;
import com.ds.seat.vo.V1_Test;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//DAO호출
	@Autowired
	private TestImpl tDAO=null;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		List<V1_Test> list=tDAO.TestSelectList();
		model.addAttribute("list", list); 
		
		return "home";
	}
	
}
