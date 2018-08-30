package com.ds.seatuse;

<<<<<<< HEAD
import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ds.seat.dao.SeatChoiceDAO;
import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.ShowPriceDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Member;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_List;
import com.ds.seat.vo.Seat_Show_Reservation;
import com.ds.seat.vo.Show_Seat;
@Controller
public class UseShowSeatController {
	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private Show_SeatDAO sseatDAO;


	@Autowired
	private SeatMemberDAO smDAO;


	@Autowired
	private SeatShowReservationDAO ssrDAO;

	//변수받기
	private static Long no=null;
	private static int[][] col=new int[100][100];


	//공연 정보
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.GET)
	public String step1(Model model,@RequestParam("show_no") Long show_no) {

		Seat_Show_List ssplVO1=ssDAO.selectSeatshowOneData(show_no);
		List<Show_Seat> scVO1=sseatDAO.SelectShowSeatList(show_no);

		model.addAttribute("ssplVO1",ssplVO1);
		model.addAttribute("scVO1",scVO1);	

		no=show_no;
		return "use/seat/step1";
	}

	//공연 좌석선택시
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.POST)
	public ModelAndView step1post(Model model,
			@RequestParam("show_no") Long show_no) {

		System.out.println("step1 : "+show_no);

		//파라미터 숨기기
		RedirectView rv=new RedirectView("homeshowseat2.do");
		rv.setExposeModelAttributes(false);
		ModelAndView mav=new ModelAndView(rv);

		return new ModelAndView(rv);
	}


	//공연 좌석
	@RequestMapping(value = "homeshowseat2.do", method = RequestMethod.GET)
	public String step2get(Model model,HttpServletRequest request) {

		List<Show_Seat> scVO1=sseatDAO.SelectShowSeatList(no);

		//좌석번호
		List<String> AlphaArray=new ArrayList<>();
		//좌석갯수
		List<Integer> SeatArrayRow=new ArrayList<>();
		List<Integer> SeatArrayCol=new ArrayList<>();

		/*for (int i = 0; i < scVO1.size(); i++) {
			//System.out.println("좌석"+scVO1.get(i).getSs_seattype());
			AlphaArray.add(scVO1.get(i).getSs_seattype());
		}*/

		//row
		for (int i = 0; i < scVO1.size(); i++) {
			System.out.println("좌석"+scVO1.get(i).getSs_seatrow());
			SeatArrayRow.add(scVO1.get(i).getSs_seatrow());
			SeatArrayCol.add(scVO1.get(i).getSs_seatcol());

			for (int j = 0; j < SeatArrayRow.get(i); j++) {
				System.out.println("값:"+ j);

				AlphaArray.add(scVO1.get(i).getSs_seattype());
			}
			
			
			/*for (int j1 = 0; j2 < scVO1.get(i).getSs_seatcol(); j2++) {
				col[i]=j2;
			}
*/
			/* 
			 *for (int i2 = 0; i2 < scVO1.get(i).getSs_seatrow(); i2++) {
				for (int j2 = 1; j2 < scVO1.get(i).getSs_seatcol() + 1; j2++) {	
					col[i2][j2 - 1] = j2;	
					System.out.print(col[i2][j2 - 1] + " ");	
					}	
				System.out.println();
				model.addAttribute("scVOseatCol",col.toString());
				}
			 */
			
			//col
			/*for (int i = 0; i < scVO1.size(); i++) {
			for (int j = 0; j < scVO1.get(i).getSs_seatcol(); j++) {
				SeatArrayCol.add(j);	
			}*/
		}

			 
			System.out.println(SeatArrayRow);
			System.out.println(SeatArrayCol);
			model.addAttribute("AlphaArray",AlphaArray);
			model.addAttribute("scVOseatCol",SeatArrayCol);
			model.addAttribute("scVOseatRow",SeatArrayRow);
			model.addAttribute("scVO1",scVO1);

			List<String> seatArray1 = new ArrayList<String>();
			//예약한좌석번호 찾기
			List<Seat_Show_Reservation> ssrlist = ssrDAO.selectSeatshowReservationSeatlList(no);

			if(ssrlist.size() != 0 || !(ssrlist.isEmpty())) {

				for (int i = 0; i < ssrlist.size(); i++) {
					String elememt= ssrlist.get(i).getSsr_seat().toString();

					StringTokenizer values = new StringTokenizer(elememt, "," );

					while(values.hasMoreElements()){

						seatArray1.add(values.nextToken() );

					}

				}
				model.addAttribute("seatArray",seatArray1);
			}
			model.addAttribute("show_no",no);


			return "use/seat/step2";
		}

		/*
	//공연 예약시
	@RequestMapping(value = "homeshowseat2.do", method = RequestMethod.POST)
	public ModelAndView step2post(Model model,HttpServletRequest request,
			@RequestParam("show_no") Long show_no,
			@RequestParam("NumberDisplay") int count,
			@RequestParam("seatsDisplay") String ssr_seat,
			HttpSession session) {

		System.out.println("step2 : "+ show_no+"/"+count+"/"+ssr_seat);

		//세션값가지고오기
		String id=(String)session.getAttribute("USESID");
		System.out.println("id : "+id);

		//로그인테이블로 m_no찾기
		Seat_Member smvo=smDAO.seatSelectMemberOne(id);
		int m_no=smvo.getM_no();

		//좌석구분용
		String Seats=null;

		//좌석총가격
		int ssr_price=0;

		//좌석별 연산용
		int vippricecount=0;
		int rpricecount=0;
		int spricecount=0;
		int apricecount=0;

		//예약한 좌석 나누기용
		String[] ssrarray = ssr_seat.split(",");	

		//출력				
		for(int i=0;i<ssrarray.length;i++) {
			System.out.println(ssrarray[i]);
			System.out.println(String.valueOf(ssrarray[i].charAt(0)));

			//좌석번호마다 좌석확인 및 계산을 위한....
			if(ssrarray[i].charAt(0) == 'V') {
				Seats="SHOW_VIPPRICE";
				//System.out.println("pricedata : "+Seats);
				ssr_price+=spDAO.selectPriceOnechk(Seats, show_no);
				vippricecount++;

			}else if(ssrarray[i].charAt(0) == 'R' ) {
				Seats="SHOW_RPRICE";
				ssr_price+=spDAO.selectPriceOnechk(Seats, show_no);
				rpricecount++;

			}else if(ssrarray[i].charAt(0) == 'S') {
				Seats="SHOW_SPRICE";
				ssr_price+=spDAO.selectPriceOnechk(Seats, show_no);
				spricecount++;

			}else if(ssrarray[i].charAt(0) == 'A') {
				Seats="SHOW_APRICE";
				ssr_price+=spDAO.selectPriceOnechk(Seats, show_no);
				apricecount++;
			}

			System.out.println("ssr_price : "+ssr_price);
			scDAO.updateMinusSeatVIPChoice(vippricecount, show_no);
			scDAO.updateMinusSeatRChoice(rpricecount, show_no);
			scDAO.updateMinusSeatSChoice(spricecount, show_no);
			scDAO.updateMinusSeatAChoice(apricecount, show_no);

			//초기화
			vippricecount=0;
			rpricecount=0;
			spricecount=0;
			apricecount=0;

		}

		Seat_Show_Reservation ssrvo=new Seat_Show_Reservation();

		ssrvo.setSsr_price(ssr_price);
		ssrvo.setSsr_seat(ssr_seat);
		ssrvo.setM_no(m_no);
		ssrvo.setShow_no(show_no);

		ssrDAO.insertSeatShowReservationOne(ssrvo);

		RedirectView rv=new RedirectView("homeshowseat3.do");
		rv.setExposeModelAttributes(false);
		ModelAndView mav=new ModelAndView(rv);

		return new ModelAndView(rv);
	}
		 */

		//공연 좌석
		@RequestMapping(value = "homeshowseat3.do", method = RequestMethod.GET)
		public String step3get(Model model) {

			//Seat_Show_Price_List ssplVO=ssDAO.selectSeatshowOneData(no); //공연정보 

			Map<String, Object> map= new HashMap<String, Object>(); 
			map=ssrDAO.selectSeatshowReservationSeatOne(no); //예약정보출력

			String id=String.valueOf(map.get("M_ID"));
			Seat_Member smVO=smDAO.seatSelectMemberOne(id);

			System.out.println("map : "+map.toString()); 

			//model.addAttribute("ssplVO",ssplVO);//가격정보
			model.addAttribute("smVO",smVO);//예약자정보

			model.addAttribute("show_no",no);//공연장번호
			model.addAttribute("seat3map",map); //예약정보
			return "use/seat/step3";

		}

		//예약완료
		@RequestMapping(value = "homeshowseat4.do", method = RequestMethod.GET)
		public String step4get(Model model) {

			return "use/seat/step4";

		}



		//공연 좌석(예약하지 않고 mypage에서 예약시)
		@RequestMapping(value = "homepayseat3.do", method = RequestMethod.GET)
		public String homePayStep3get(Model model,
				@RequestParam("show_no") String show_no,@RequestParam("ssr_no") int ssr_no) {


			//Seat_Show_Price_List ssplVO=ssDAO.selectSeatshowOneData(Long.parseLong(show_no)); //공연정보 

			Map<String, Object> map= new HashMap<String, Object>(); 
			map=ssrDAO.selectSeatshowReservationMemberOne(ssr_no);//예약정보

			String id=String.valueOf(map.get("M_ID"));
			Seat_Member smVO=smDAO.seatSelectMemberOne(id);

			System.out.println("map : "+map.toString()); 

			model.addAttribute("smVO",smVO);//예약자정보
			//model.addAttribute("ssplVO",ssplVO);//가격정보
			model.addAttribute("show_no",no);//공연장번호
			model.addAttribute("seat3map",map); //예약정보
			return "use/seat/step3";

		}


	}
=======
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
>>>>>>> refs/remotes/origin/master
