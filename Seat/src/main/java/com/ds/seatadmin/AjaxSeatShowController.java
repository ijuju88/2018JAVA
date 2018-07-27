package com.ds.seatadmin;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_Price_List;
import com.ds.seat.vo.Show_Price;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@RestController
@MapperScan({"com.ds.seat.dao"})
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class AjaxSeatShowController {

	@Autowired
	private SeatShowDAO ssDAO;


	//공연예약페이지
	@RequestMapping(value = "ajax_adminshowseatlist.do", method = RequestMethod.POST)
	public List<Seat_Show_Price_List> adminshowseat(Model model, HttpServletRequest request ) {
		List<Seat_Show_Price_List> list=ssDAO.selectSeatshowList();
		System.out.println(list.toString());

		return list;
	}


}
