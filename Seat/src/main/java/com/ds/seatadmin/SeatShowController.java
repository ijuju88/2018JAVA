package com.ds.seatadmin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.ShowPriceDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Show_Price;

@Controller
public class SeatShowController {


	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private ShowPriceDAO spDAO;


	//공연삭제페이지
	@RequestMapping(value = "adminshowseatdelete.do", method = RequestMethod.GET)
	public String adminshowseatdelete(Model model,HttpServletRequest request, 
			@RequestParam("show_no") String show_no) {
		try {

			Seat_Show sVO=ssDAO.selectSeatshowImgs(Long.parseLong(show_no.replaceAll("'","")));

			//그림삭제
			String filename = sVO.getShow_img1();
			String uploadFileName = request.getSession().getServletContext().getRealPath("img")+"\\"+ filename;


			File uploadfile = new File (uploadFileName);
			if ( uploadfile.exists()&& uploadfile.isFile() )
			{
				uploadfile.delete();       // 파일 삭제
			}


			String filename2 = sVO.getShow_img2();
			String uploadFileName2 = request.getSession().getServletContext().getRealPath("img")+"\\"+ filename2;


			File uploadfile2 = new File (uploadFileName2);
			if ( uploadfile2.exists()&& uploadfile2.isFile() )
			{
				uploadfile2.delete();       // 파일 삭제
			}

			ssDAO.seatShowDelete(show_no);
			spDAO.ShowPriceDelete(show_no);

		} catch (Exception e) {
			System.out.println("삭제 컨트롤러 에러 : "+e.getMessage());
		}
		return "redirect:adminshowseat.do";
	}



	//공연등록 파일페이지
	@RequestMapping(value = "adminshowseatedit.do", method = RequestMethod.POST)
	public String adminshowseatedit
	(Model model, HttpServletRequest request,
			@RequestParam("show_no") String show_no, @RequestParam("show_title") String show_title,
			@RequestParam("show_content") String show_content,
			@RequestParam("show_vipprice") int show_vipprice,@RequestParam("show_rprice") int show_rprice,
			@RequestParam("show_sprice") int show_sprice,@RequestParam("show_aprice") int show_aprice,
			@RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date,
			@RequestParam(value="show_img1", defaultValue = "false") MultipartFile show_img1, 
			@RequestParam(value="show_img2", defaultValue = "false") MultipartFile show_img2) 
	{

		try {
			//시간관련 format로 인한 데이터 추가
			String sdate=start_date+":00";
			String edate=end_date+":00";

			//vo에담기
			Seat_Show sVO=new Seat_Show();
			sVO.setShow_no(Long.parseLong(show_no.replaceAll("'","")));
			sVO.setShow_title(show_title);
			sVO.setShow_content(show_content);
			sVO.setShow_startdate(sdate);
			sVO.setShow_enddate(edate);

			if(show_img1 != null && !show_img2.isEmpty()) {
				//file 관련
				//System.out.println("show_img1 : "+show_img1);

				String savePath = request.getSession().getServletContext().getRealPath("img"); //저장경로
				adminshowseatfile(show_img1,show_no, savePath);
				adminshowseatfile(show_img2,show_no, savePath);
				sVO.setShow_img1(adminshowseatfile(show_img1,show_no, savePath));
				sVO.setShow_img2(adminshowseatfile(show_img2,show_no, savePath));

				ssDAO.insertSeatShowOne(sVO);

			}else {
				System.out.println("데이터 수정없음");
				ssDAO.insertSeatShowOne2(sVO);
			}

			Show_Price spVO=new Show_Price();
			spVO.setShow_no(Long.parseLong(show_no.replaceAll("'","")));
			spVO.setShow_vipprice(show_vipprice);
			spVO.setShow_rprice(show_rprice);
			spVO.setShow_sprice(show_sprice);
			spVO.setShow_aprice(show_aprice);

			spDAO.insertShowPriceOne(spVO);

		} catch (Exception e) {
			System.out.println("입력 컨트롤러 에러 : "+e.getMessage());
		}

		return "redirect:adminshowseat.do";
	}

	private String adminshowseatfile(MultipartFile img, String show_no, String savePath) {
		//file 관련
		String originalFilename = img.getOriginalFilename(); // fileName.jpg
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg

		String rename = onlyFileName + "_" + show_no + extension; // fileName_20150721-14-07-50.jpg
		String fullPath = savePath + "\\" + rename;

		System.out.println("savePath : "+savePath);
		if (!img.isEmpty()) {
			try {
				byte[] bytes = img.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
				stream.write(bytes);
				stream.close();

			} catch (Exception e) {
				System.out.println("file작업에러 : "+e.getMessage());
			}
		}
		return rename;
	}



}
