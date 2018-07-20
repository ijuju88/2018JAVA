package com.ds.seatadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ds.seat.dao.SeatShowDAO;

@Controller
public class SeatShowController {
	
	@Autowired
	private SeatShowDAO ssDAO;
	
	//공연삭제페이지
	@RequestMapping(value = "adminshowseatdelete.do", method = RequestMethod.GET)
	public String adminshowseatdelete(Model model, @RequestParam("show_no") String show_no) {
		try {
			System.out.println(show_no);
			ssDAO.seatSelectMemberDelete(show_no);
			
		} catch (Exception e) {
			System.out.println("삭제 컨트롤러 에러 : "+e.getMessage());
		}
		return "redirect:adminshowseat.do";
	}
	
	
	
	//공연등록 파일페이지
		@RequestMapping(value = "adminshowseatfile.do", method = RequestMethod.GET)
		public String adminshowseatfile(Model model) {
			return "admin/adminshowseatfile";
		}

}
