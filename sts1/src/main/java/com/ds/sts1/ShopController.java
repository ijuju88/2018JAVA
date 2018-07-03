package com.ds.sts1;

import java.io.InputStream;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.sts1.dao.ItemDAO;
import com.ds.sts1.vo.V1_Item;

@Controller
public class ShopController {

	@Autowired
	private ItemDAO iDAO=null;

	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String mypage(HttpSession httpsession) {

		String id=(String)httpsession.getAttribute("SID");

		if(id == null) {
			return "redirect:login.do";
		}

		return "mypage";
	}

	@RequestMapping(value="cart.do", method=RequestMethod.GET)
	public String cart(HttpSession httpsession) {

		String id=(String)httpsession.getAttribute("SID");

		if(id == null) {
			//httpsession.setAttribute("BACK_URL", "mypage.do");
			return "redirect:login.do";
		}

		return "cart";
	}



	@RequestMapping(value= {"item_img.do"}, method=RequestMethod.GET)
	public ResponseEntity<byte[]> itemImg(@RequestParam(value="itm_no") int no,HttpServletRequest request, HttpServletResponse response) {

		try {

			V1_Item vo = iDAO.selectItemImg(no);
			byte[] img=null;
			

			if(vo.getItm_img1().length >0) {
				img=vo.getItm_img1();
			}else if(vo.getItm_img2().length >0) {
				img=vo.getItm_img2();
			}else if(vo.getItm_img3().length >0) {
				img=vo.getItm_img3();
			}else {
				InputStream is=request.getSession().getServletContext().getResourceAsStream
				("/resources/img/default.png");
				
				img=IOUtils.toByteArray(is);
			}
			
			HttpHeaders header= new HttpHeaders();
			header.setContentType(MediaType.IMAGE_JPEG);
			
			return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);

		} catch (Exception e) {
			System.out.println("이미지 컨트롤러 에러 : "+e.getMessage());
		}
		return null;
	}

}
