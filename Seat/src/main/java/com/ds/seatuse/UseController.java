package com.ds.seatuse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_List;
import com.ds.seat.vo.Show_Seat;


/**
 * Handles requests for the application home page.
 */
@Controller
public class UseController {

	@Autowired
	private SeatShowDAO ssDAO;


	
	//공연 자세히 들어가기
	@RequestMapping(value = "homeseatintro.do", method = RequestMethod.GET)
	public String homeseatintro(Model model,@RequestParam("show_no") Long show_no) {

		Seat_Show_List ssplVO=ssDAO.selectSeatshowOneData(show_no);
		try {
			//System.out.println("show_title : "+list.);
			model.addAttribute("ssplVO",ssplVO);
			
			return "use/seat/homeseatintro";
			
		} catch (Exception e) {
			System.out.println("homeseatintro 에러: "+e.getMessage());
			return "redirect:home.do";
		}
		
	}


}

