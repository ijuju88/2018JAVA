package com.ds.sts1;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ds.sts1.dao.ItemDAO;
import com.ds.sts1.dao.MemberDAO;
import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Member;


@Controller
public class AdminController {

	//DAO호출
	@Autowired
	private ItemDAO iDAO=null;
	@Autowired
	private MemberDAO mDAO=null;

	@RequestMapping(value="admin.do", method=RequestMethod.GET)
	public String admin(HttpServletRequest request, HttpServletResponse response) {

		String menu=request.getParameter("menu");
		if(menu.equals("1")) {
			int no=iDAO.selectItemNo();
			request.setAttribute("no", no+1);

			List<V1_Item> list = iDAO.selectItem();
			request.setAttribute("list", list); 
		}else if(menu.equals("2")) {
			List<V1_Member> list1 = mDAO.selectMemberList();

			request.setAttribute("list1", list1); 
		}else if(menu.equals("0") || menu.equals("")) {

		}

		return "admin"; //admin.jsp 화면에 표시

	}


	@RequestMapping(value="admin-item-insert.do", method=RequestMethod.POST)
	public String adminInsertItem
	(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mrequest) {
		try {
			V1_Item vo=new V1_Item();
			vo.setItm_no(Integer.parseInt(request.getParameter("itm_no")));
			vo.setItm_name(request.getParameter("itm_name"));
			vo.setItm_content(request.getParameter("itm_content"));
			vo.setItm_price(Integer.parseInt(request.getParameter("itm_price")));
			vo.setItm_qty(Integer.parseInt(request.getParameter("itm_qty")));


			//input type="file"
			MultipartFile itm_img1=mrequest.getFile("itm_img1");
			MultipartFile itm_img2=mrequest.getFile("itm_img2");
			MultipartFile itm_img3=mrequest.getFile("itm_img3");

			System.out.println("img3 : "+itm_img3.getOriginalFilename());
			System.out.println("vo : "+vo.toString());

			if((itm_img1 != null) && (!itm_img1.getOriginalFilename().equals(""))) {
				vo.setItm_img1(itm_img1.getBytes());
			}

			if((itm_img2 != null) && (!itm_img2.getOriginalFilename().equals(""))) {
				vo.setItm_img2(itm_img2.getBytes());
			}

			if((itm_img3 != null) && (!itm_img3.getOriginalFilename().equals(""))) {
				vo.setItm_img3(itm_img3.getBytes());
			}

			iDAO.insertItemOne(vo);

		} catch (Exception e) {
			System.out.println("파일컨트롤러 에러 : "+e.getMessage());
		}

		return "redirect:admin.do?menu=1";
	}


	//localhost/sts1/item-select-img.do?itm_no=33&itm_img_idx=3
	@RequestMapping(value="item-select-img.do")
	public ResponseEntity<byte[]> itemSelectImg(HttpServletRequest request, HttpServletResponse response) {
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		try {
			String no=request.getParameter("itm_no");
			String idx=request.getParameter("itm_img_idx");

			V1_Item vo = iDAO.selectItemImg(Integer.parseInt(no),Integer.parseInt(idx));


			byte[] tmp=null;

			if(idx.equals("1")) {
				tmp=vo.getItm_img1();
			}else if(idx.equals("2")) {
				tmp=vo.getItm_img2();
			}else if(idx.equals("3")) {
				tmp=vo.getItm_img3();
			}

			
			
			//실제 데이터, header, 상태
			return  new ResponseEntity<byte[]>(tmp, header, HttpStatus.OK);


		} catch (Exception e) {
			try{
				
				InputStream is=request.getSession().getServletContext().getResourceAsStream("/resources/img/default.png");

				//읽은 파일을 byte[]로 변환
				byte[] tmp=IOUtils.toByteArray(is);

				return new ResponseEntity<byte[]>(tmp, header, HttpStatus.OK);

			} catch (Exception e2) {
				// TODO: handle exception
			}


			System.out.println("이미지 컨트롤러 에러 : "+e.getMessage());
			return null;
		}



	}
}
