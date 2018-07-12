package com.ds.sts1;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ds.sts1.dao.ItemDAO;
import com.ds.sts1.dao.ItemImpl;
import com.ds.sts1.exception.PageNotFoundException;
import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ItemImpl iDAO=null;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {

		/*Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );*/


		return "redirect:home.do";
	}





	//404 오류처리
	@RequestMapping(value="/{page}", method=RequestMethod.GET)
	public String page(@PathVariable("page") String page,HttpServletRequest request, HttpServletResponse response) {
		System.out.println(page);
		if(page.equals("home")) {
			List<V1_Item> list = iDAO.selectItem();
			
			//System.out.println("item사이즈 : "+list.size());
			request.setAttribute("list", list); 
			
			request.setAttribute("size", list.size() % 2);
			return "home";
			
		}
		else {
			//오류 강제로 하기
			throw new PageNotFoundException();
			//return "page404";
		}

	}


	@ExceptionHandler(PageNotFoundException.class)
	public String pageNotFound() {
		return "page404";
	}
}
