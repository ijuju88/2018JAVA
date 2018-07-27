package com.ds.seatadmin;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.*;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ds.seat.dao.Notice_BoardDAO;
import com.ds.seat.vo.Notice_Board;
import com.fasterxml.jackson.databind.ObjectMapper;


@RestController
public class AjaxAdminController {
	@Autowired
	private Notice_BoardDAO nbDAO;

	//공지사항 이미지 업로드용
	@RequestMapping(value = "ImageUpload.do", method = RequestMethod.POST)
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String root_path = request.getSession().getServletContext().getRealPath("resources/img/notice_pic");
		//Set<String> root_path = request.getSession().getServletContext().getResourcePaths("/resources/img/notice_pic/");

		System.out.println(this.getClass().getResource("").getPath());	

		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = root_path+ "\\" +str_filename;
		System.out.println("파일경로 :" +filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println(str_filename);
		out.close();

	}


	//불러오기
	@RequestMapping(value = "NoticeImage.do", method = RequestMethod.GET)
	public void homeImgTitle
	(HttpServletRequest request,HttpServletResponse response, @RequestParam("imgname") String imgname)
	{
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		try {
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;


			String root_path = request.getSession().getServletContext().getRealPath("resources/img/notice_pic");

			File file = new File (root_path+"\\"+imgname);

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
				bis.close();
				bos.close();

			}

		} catch (Exception e) {

		}
	}


	//공지사항이미지 삭제
	@RequestMapping(value = "ImageDelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void profileDelete(@RequestParam(value="filename") String filename,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");

		System.out.println("org : "+filename);
		
		// 업로드할 폴더 경로
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		String attach_path = "resources/img/notice_pic";

		boolean delYn = true;
		File file = new File (root_path + "/" + attach_path+"/"+filename);
		
		System.out.println("file: "+file);
		if (file.exists()&& file.isFile() )
		{
			
			System.out.println("삭제준비");
			delYn=file.delete();       // 파일 삭제
		}

	}





	//공지사항카테고리별목록
	@RequestMapping(value = "notice_list.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Notice_Board> noticeListPOST(Model model,@RequestParam(value="category")int category) {
		try {

			String CategoryName=null;
			List<Notice_Board> list=new ArrayList<Notice_Board>();
			int datachk=1;

			if(category==0) {
				//System.out.println("category : "+category);
				list=nbDAO.selectNoticeBoardList();
			}else if(category==1){
				//System.out.println("category : "+category);
				CategoryName="공지사항";
				list=nbDAO.selectNoticeBoardCategoryList(CategoryName);
			}else if(category==2){
				//System.out.println("category : "+category);
				CategoryName="이벤트";
				list=nbDAO.selectNoticeBoardCategoryList(CategoryName);
			}else if(category==3){
				//System.out.println("category : "+category);
				CategoryName="기타";
				list=nbDAO.selectNoticeBoardCategoryList(CategoryName);
			}

			System.out.println("list : "+list);

			return list;

		} catch (Exception e) {
			System.out.println("공지사항게시판 에러 : "+e.getMessage());
			return null;
		}

	}



}
