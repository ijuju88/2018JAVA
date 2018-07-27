package com.ds.seat;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_Price_List;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SeatShowDAO ssDAO;

	@RequestMapping(value = {"home.do", "/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		try {
			List<Seat_Show_Price_List> ssplList=ssDAO.selectSeatshowList();
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
}