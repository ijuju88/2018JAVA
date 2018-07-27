package com.ds.seat;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.SeatChoiceDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Member_Reservation;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_List;
import com.ds.seat.vo.Show_Seat;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SeatShowDAO ssDAO;
	
	@Autowired
	private SeatShowReservationDAO ssrDAO;

	@Autowired
	private SeatChoiceDAO scDAO;
	
	@Autowired
	private Show_SeatDAO sseatDAO;

	
	@RequestMapping(value = {"home.do", "/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		try {

			 List<Seat_Member_Reservation> ssrVO=new ArrayList<>(); //목록받기

			String[] ssr_seat_split=null; //구분자 구분용

			/*//좌석별 연산용
			int vippricecount=0;
			int rpricecount=0;
			int spricecount=0;
			int apricecount=0;

			//하루지난 데이터 찾기
			ssrVO=ssrDAO.selectUseSeatshowNotReservationList();
			for (int j = 0; j < ssrVO.size(); j++) {
				
				String ssr_seat=ssrVO.get(j).getSsr_seat();
				Long ssr_show_no=ssrVO.get(j).getShow_no();
				
				//좌석나누기
				StringTokenizer values = new StringTokenizer(ssr_seat, "," );

				ssr_seat_split=ssr_seat.split(",");

				//자른것중 첫글자를 구분해서 좌석수 변화시키기
				for (int i = 0; i < ssr_seat_split.length; i++) {

					if(ssr_seat_split[i].charAt(0) == 'A' || ssr_seat_split[i].charAt(0) == 'B') {

						vippricecount++;
					}else if(ssr_seat_split[i].charAt(0) == 'C' || ssr_seat_split[i].charAt(0) == 'D'  
							|| ssr_seat_split[i].charAt(0) == 'E') {
						rpricecount++;

					}else if(ssr_seat_split[i].charAt(0) == 'F' || ssr_seat_split[i].charAt(0) == 'G'  
							|| ssr_seat_split[i].charAt(0) == 'H') {

						spricecount++;
					}else if(ssr_seat_split[i].charAt(0) == 'I' || ssr_seat_split[i].charAt(0) == 'J'  || 
							ssr_seat_split[i].charAt(0) == 'K' || ssr_seat_split[i].charAt(0) == 'L') {
						apricecount++;
					}

				}
				
				System.out.println("seatcount : "+vippricecount+"/"+rpricecount+"/"+spricecount+"/"+apricecount);
				scDAO.updatePlusSeatVIPChoice(vippricecount, ssr_show_no);
				scDAO.updatePlusSeatRChoice(rpricecount, ssr_show_no);
				scDAO.updatePlusSeatSChoice(spricecount, ssr_show_no);
				scDAO.updatePlusSeatAChoice(apricecount, ssr_show_no);
				
				//좌석수 초기화(다음을 위한)
				vippricecount=0;
				rpricecount=0;
				spricecount=0;
				apricecount=0;

				ssrDAO.deleteSeatshowReservation(ssrVO.get(j).getSsr_no());
				
			}*/
			
			
			//공연정보 출력
			List<Seat_Show_List> ssplList=ssDAO.selectSeatshowListNext();

			model.addAttribute("ssplList", ssplList);
			
		} catch (Exception e) {
			System.out.println("ShowList 컨트롤러 에러 : "+e.getMessage());
		}

		return "home";
	}


	//이미지관련
	@RequestMapping(value = "homeimgtitle.do", method = RequestMethod.GET)
	public void homeImgTitle
	(HttpServletRequest request,HttpServletResponse response,
	@RequestParam("show_no") Long show_no, @RequestParam("idx") String idx)
	{
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		try {
			Seat_Show ssVO=ssDAO.selectSeatshow(show_no);

			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			String filename=null;
			
			if(idx.equals("1")) {
				System.out.println("1번이미지"+ssVO.getShow_img1());
				filename = ssVO.getShow_img1();
			}else if(idx.equals("2")){
				System.out.println("2번이미지"+ssVO.getShow_img2());
				filename = ssVO.getShow_img2();
			}

			String root_path = request.getSession().getServletContext().getRealPath("/");  
			String attach_path = "resources/img/pic";


			File file = new File (root_path + "\\" + attach_path+"\\"+filename);
			int size = (int) file.length();
			
			if ( file.exists()&& file.isFile() )
			{
				bos = new BufferedOutputStream(response.getOutputStream());
				byte b[] = new byte[2048];
				int read = 0;
				if (size > 0 && file.isFile()) {
					bis = new BufferedInputStream(new FileInputStream(file));
					while ((read = bis.read(b)) != -1) {
						bos.write(b, 0, read);
					}
				}
				bos.close();

			}

		} catch (Exception e) {

		}
	}
	
	//회사소개페이지
	@RequestMapping(value = "about.do", method = RequestMethod.GET)
	public String adbout(Model model) {
		
		return "about";
	}


}