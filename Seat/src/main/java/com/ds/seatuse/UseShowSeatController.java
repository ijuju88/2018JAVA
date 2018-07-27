package com.ds.seatuse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.RedirectViewControllerRegistration;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.ds.seat.dao.SeatChoiceDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.vo.Seat_Choice;
import com.ds.seat.vo.Seat_Show_Price_List;
@Controller
public class UseShowSeatController {
	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private SeatChoiceDAO scDAO;
	
	//변수받기
	public Long no=0L;
	public int seat=0;


	//공연 정보
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.GET)
	public String step1(Model model,@RequestParam("show_no") Long show_no) {

		Seat_Show_Price_List ssplVO1=ssDAO.selectSeatshowOneData(show_no);
		Seat_Choice scVO1=scDAO.selectSeatChoiceOne(show_no);

		model.addAttribute("ssplVO1",ssplVO1);
		model.addAttribute("scVO1",scVO1);	

		return "use/seat/step1";
	}

	//공연 좌석선택시
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.POST)
	public ModelAndView step1post(Model model,
			@RequestParam("show_no") Long show_no) {

		System.out.println("step1 : "+show_no);
		no=show_no;

		//model.addAttribute("show_no",show_no);
		//model.addAttribute("show_seatchoice",show_seatchoice);

		//파라미터 숨기기
		RedirectView rv=new RedirectView("homeshowseat2.do");
		rv.setExposeModelAttributes(false);
		ModelAndView mav=new ModelAndView(rv);

		return new ModelAndView(rv);
	}


	//공연 좌석
	@RequestMapping(value = "homeshowseat2.do", method = RequestMethod.GET)
	public String step2get(Model model,HttpServletRequest request) {
		//System.out.println("step2 : "+ no);
		model.addAttribute("show_no",no);
		
		//좌석번호
		String[] AlphaArray= {"A","B","C","D","E","F","G","H","I","J","K","L"};
		model.addAttribute("AlphaArray",AlphaArray);
		
		return "use/seat/step2";
	}


	//공연 좌석
	@RequestMapping(value = "homeshowseat3.do", method = RequestMethod.GET)
	public String step3(Model model,@RequestParam("show_no") Long show_no) {

		return "use/seat/step3";

	}

	//공연 좌석
	@RequestMapping(value = "homeshowseat4.do", method = RequestMethod.GET)
	public String step4(Model model,@RequestParam("show_no") Long show_no) {

		return "use/seat/step4";

	}

}
