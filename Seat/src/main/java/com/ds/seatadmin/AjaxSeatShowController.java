package com.ds.seatadmin;

import java.text.*;
import java.util.*;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.vo.Seat_Show;


@RestController
@MapperScan({"com.ds.seat.dao"})
public class AjaxSeatShowController {
	
	@Autowired
	private SeatShowDAO ssDAO;
	
	//공연예약페이지
		@RequestMapping(value = "ajax_adminshowseatlist.do", method = RequestMethod.POST)
		public List<Seat_Show> adminshowseat(Model model) {
			List<Seat_Show> list=ssDAO.selectSeatshowList();
			model.addAttribute("list", list); 
			System.out.println(list.toString());
			
			return list;
	}
		
	
	//공연예약만들기
	@RequestMapping
	(value = "ajax_adminshowseat.do", produces="application/json",
	method = RequestMethod.POST)
	public Map<String, Object> adminshowseatinsert(Model model,@RequestBody Seat_Show form) throws ParseException {
		
		//System.out.println("TestForm : "+ form.getShow_startdate());
		
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			String sdate=form.show_startdate+":00";
			String edate=form.show_enddate+":00";

			Seat_Show sVO=new Seat_Show();
			sVO.setShow_no(form.show_no);
			sVO.setShow_title(form.show_title);
			sVO.setShow_content(form.show_content);
			sVO.setShow_startdate(sdate);
			sVO.setShow_enddate(edate);
			
			System.out.println(sdate+"/"+edate);

			ssDAO.insertSeatShowOne(sVO);
			map.put("ret", "y");
			return map;
		} catch (Exception e) {
			map.put("ret", "n");
			System.out.println("댓글 컨트롤러 에러 : "+e.getMessage());
			return map;
		}
		
	}
	
}
