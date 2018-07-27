package com.ds.seatadmin;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ds.seat.dao.SeatChoiceDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.ShowPriceDAO;
import com.ds.seat.vo.Seat_Choice;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Show_Price;

@Controller
public class SeatShowController {


	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private ShowPriceDAO spDAO;
	
	@Autowired
	private SeatChoiceDAO scDAO;

	//공연삭제페이지
	@RequestMapping(value = "adminshowseatdelete.do", method = RequestMethod.GET)
	public String adminshowseatdelete(Model model,HttpServletRequest request, 
			@RequestParam("show_no") String show_no) {
		try {

			Seat_Show sVO=ssDAO.selectSeatshow(Long.parseLong(show_no.replaceAll("'","")));

			//그림삭제
			String filename = sVO.getShow_img1();
			String root_path = request.getSession().getServletContext().getRealPath("/");  
			String attach_path = "resources/img/pic";


			File uploadfile = new File (root_path + "\\" + attach_path+"\\"+filename);
			if ( uploadfile.exists()&& uploadfile.isFile() )
			{
				uploadfile.delete();       // 파일 삭제
			}


			String filename2 = sVO.getShow_img2();
			String root_path2 = request.getSession().getServletContext().getRealPath("/");  
			String attach_path2 = "resources/img/pic";


			File uploadfile2 = new File (root_path2 + "\\" + attach_path2+"\\"+filename2);

			if ( uploadfile2.exists()&& uploadfile2.isFile() )
			{
				uploadfile2.delete();       // 파일 삭제
			}

			spDAO.ShowPriceDelete(show_no);
			scDAO.SeatChoiceDelete(show_no);
			ssDAO.seatShowDelete(show_no);

		} catch (Exception e) {
			System.out.println("삭제 컨트롤러 에러 : "+e.getMessage());
		}
		return "redirect:adminshowseat.do";
	}



	//공연등록 파일페이지
	@RequestMapping(value = "adminshowseatedit.do", method = RequestMethod.POST)
	public String adminshowseatedit
	(Model model, HttpServletRequest request,
			@RequestParam("show_no") String show_no, @RequestParam("show_id") int show_id,
			@RequestParam("show_title") String show_title,
			@RequestParam("show_content") String show_content,
			@RequestParam("show_vipprice") int show_vipprice,@RequestParam("show_rprice") int show_rprice,
			@RequestParam("show_sprice") int show_sprice,@RequestParam("show_aprice") int show_aprice,
			@RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date,
			@RequestParam("file_img1") String file_img1, @RequestParam("file_img2") String file_img2,
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
			sVO.setShow_id(show_id);
			sVO.setShow_title(show_title);
			sVO.setShow_content(show_content);
			sVO.setShow_startdate(sdate);
			sVO.setShow_enddate(edate);

			String root_path = request.getSession().getServletContext().getRealPath("/");  
			String attach_path = "resources/img/pic";
			
			UUID uid = UUID.randomUUID();

			//System.out.println("img1 : "+show_img1.isEmpty());
			
			if(show_img1.isEmpty() == true) {
				System.out.println("1번이미지");
				adminshowseatfile(show_img2,root_path + attach_path , uid+""+file_img2);
				sVO.setShow_img1(file_img1);
				sVO.setShow_img2(uid+""+file_img2);
			}else if(show_img2.isEmpty() == true) {
				System.out.println("2번이미지");
				adminshowseatfile(show_img1,root_path + attach_path , uid+""+file_img1);
				sVO.setShow_img1(uid+""+file_img1);
				sVO.setShow_img2(file_img2);
			}else if(show_img1.isEmpty() == true || show_img2.isEmpty() == true){
				System.out.println("1번2번이미지");
				sVO.setShow_img1(file_img1);
				sVO.setShow_img2(file_img2);
			}
			else {
				System.out.println("1번2번이미지");
				adminshowseatfile(show_img1,root_path + attach_path , uid+""+file_img1);
				adminshowseatfile(show_img2,root_path + attach_path , uid+""+file_img2);
				sVO.setShow_img1(uid+""+file_img1);
				sVO.setShow_img2(uid+""+file_img2);
			}
			

			ssDAO.insertSeatShowOne(sVO);
			
			
			Show_Price spVO=new Show_Price();
			spVO.setShow_no(Long.parseLong(show_no.replaceAll("'","")));
			spVO.setShow_vipprice(show_vipprice);
			spVO.setShow_rprice(show_rprice);
			spVO.setShow_sprice(show_sprice);
			spVO.setShow_aprice(show_aprice);

			spDAO.insertShowPriceOne(spVO);
			
			Seat_Choice scVO=new Seat_Choice();
			scVO.setShow_no(Long.parseLong(show_no.replaceAll("'","")));
			scDAO.insertSeatChoiceOne(scVO.getShow_no());

		} catch (Exception e) {
			System.out.println("입력 컨트롤러 에러 : "+e.getMessage());
		}

		return "redirect:adminshowseat.do";
	}

	private FileOutputStream fos;
	
	 public void adminshowseatfile(MultipartFile file, String path, String fileName) {
		//file 관련
		 try{
	         
	            byte fileData[] = file.getBytes();
	            fos = new FileOutputStream(path + "\\" + fileName);
	            System.out.println("path:"+path + "\\" + fileName);
	            fos.write(fileData);
	         
	        }catch(Exception e){
	            e.printStackTrace();
	             
	        }finally{
	            if(fos != null){
	                 
	                try{
	                    fos.close();
	                }catch(Exception e){}
	                 
	                }
	        }// try end;
	         
	    }// wirteFile() end;

}
