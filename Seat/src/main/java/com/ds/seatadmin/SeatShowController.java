package com.ds.seatadmin;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Show_Seat;

@Controller
public class SeatShowController {


	@Autowired
	private SeatShowDAO ssDAO;
	
	@Autowired
	private Show_SeatDAO sseatDAO;


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

			
			sseatDAO.ShowSeatDelete(show_no);
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
			@RequestParam("show_content") String show_content, @RequestParam("ss_no") String ss_no,
			@RequestParam("ss_seattype") String[] ss_seattype,@RequestParam("ss_seatpay") int[] ss_seatpay,
			@RequestParam("ss_seatrow") int[] ss_seatrow,@RequestParam("ss_seatcol") int[] ss_seatcol,
			@RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date,
			@RequestParam("file_img1") String file_img1, @RequestParam("file_img2") String file_img2,
			@RequestParam(value="file_img1UUID", defaultValue = "false") String file_img1UUID, 
			@RequestParam(value="show_img1", defaultValue = "false") MultipartFile show_img1, 
			@RequestParam(value="file_img2UUID", defaultValue = "false") String file_img2UUID, 
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
			
			if(show_img1.isEmpty() == true || show_img2.isEmpty() == true){
				System.out.println("1번2번이미지");
				sVO.setShow_img1(file_img1UUID+"_"+file_img1);
				sVO.setShow_img2(file_img2UUID+"_"+file_img2);
			} else if(show_img1.isEmpty() == true) {
				System.out.println("1번이미지");
				adminshowseatfile(show_img2,root_path + attach_path , uid+"_"+file_img2);
				sVO.setShow_img1(file_img1UUID+"_"+file_img1);
				sVO.setShow_img2(uid+"_"+file_img2);
			}else if(show_img2.isEmpty() == true) {
				System.out.println("2번이미지");
				adminshowseatfile(show_img1,root_path + attach_path , uid+"_"+file_img1);
				sVO.setShow_img1(uid+"_"+file_img1);
				sVO.setShow_img2(file_img2UUID+"_"+file_img2);
			}
			else {
				System.out.println("1번2번이미지");
				adminshowseatfile(show_img1,root_path + attach_path , uid+"_"+file_img1);
				adminshowseatfile(show_img2,root_path + attach_path , uid+"_"+file_img2);
				sVO.setShow_img1(uid+"_"+file_img1);
				sVO.setShow_img2(uid+"_"+file_img2);
			}


			ssDAO.insertSeatShowOne(sVO);


			//좌석, 가격추가
			Show_Seat sseatVO=new Show_Seat();

			sseatDAO.ShowSeatDelete(show_no);

			for (int i = 0; i < ss_seattype.length; i++) {
				sseatVO.setSs_no(ss_no+"_"+i);
				sseatVO.setShow_no(Long.parseLong(show_no.replaceAll("'","")));
				
				sseatVO.setSs_seattype(ss_seattype[i]);
				sseatVO.setSs_seatpay(ss_seatpay[i]);
				sseatVO.setSs_seatrow(ss_seatrow[i]);
				sseatVO.setSs_seatcol(ss_seatcol[i]);
				
				System.out.println("sseatvo:"+sseatVO.toString());
				
				sseatDAO.insertShowSeatOne(sseatVO);
			}
			

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
