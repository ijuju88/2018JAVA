package com.ds.sts1;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.sts1.dao.CartImpl;
import com.ds.sts1.dao.DeliveryImpl;
import com.ds.sts1.dao.ItemDAO;
import com.ds.sts1.dao.ItemImpl;
import com.ds.sts1.dao.OrderImpl;
import com.ds.sts1.vo.V1_Board;
import com.ds.sts1.vo.V1_Cart;
import com.ds.sts1.vo.V1_Item;
import com.ds.sts1.vo.V1_Order;

@Controller
public class ShopController {

	@Autowired
	private ItemImpl iDAO=null;

	@Autowired
	private CartImpl cDAO=null;
	
	@Autowired
	private OrderImpl oDAO=null;
	
	@Autowired
	private DeliveryImpl dDAO=null;

	//내정보
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String mypage(HttpSession httpsession) {

		String id=(String)httpsession.getAttribute("SID");

		if(id == null) {
			return "redirect:login.do";
		}

		return "mypage";
	}

	//장바구니추가
	@RequestMapping(value="cart.do", method=RequestMethod.GET)
	public String cartinsert(HttpSession httpsession, HttpServletResponse response ,@RequestParam(value="itm_no", defaultValue="0") int no) {
		V1_Cart vo=new V1_Cart();
		try {
			String id=(String)httpsession.getAttribute("SID");
			httpsession.setAttribute("ITM_NO", no);
			if(id == null) {
				//httpsession.setAttribute("BACK_URL", "mypage.do");
				return "redirect:login.do";
			}

			int itm_no=(Integer)httpsession.getAttribute("ITM_NO");

			if(no>0) {
				vo.setItm_no(itm_no);
				vo.setMem_id(id);
				vo.setCrt_no(1);
				cDAO.CartInsert(vo);
				PrintWriter writer = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				writer.println("<script>alert('장바구니 추가완료!!'); location.reload();</script>");
				writer.flush();


			}			
			//System.out.println("idao : "+list.getItm_no());

		} catch (Exception e) {
			System.out.println("cartinsert컬트롤러 에러 : "+e.getMessage());
		}

		return "redirect:home.do";
	}

	//장바구니보기
	@RequestMapping(value="cartlist.do", method=RequestMethod.GET)
	public String cart(HttpSession httpsession,Model model) {

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String id=(String)httpsession.getAttribute("SID");

			if(id == null) {
				//httpsession.setAttribute("BACK_URL", "mypage.do");
				return "redirect:login.do";
			}


			List<V1_Cart> list=cDAO.selectItemList(id);
			System.out.println(list.toString());

			model.addAttribute("list", list);

			return "cart";
		} catch (Exception e) {
			System.out.println("cart컨트롤러 에러 : "+e.getMessage());
			return null;
		}

	}



	//구매하기페이지
	@RequestMapping(value="order.do", method=RequestMethod.GET)
	public String order(@RequestParam("itm_no") int itm_no, Model model) {
		V1_Item vo = iDAO.selectEditItemOne(itm_no);
		model.addAttribute("vo", vo);

		return "order";
	}
	
	
	//주문완료
		@RequestMapping(value="order.do", method=RequestMethod.POST)
		public String order(@RequestParam("itm_no") int itm_no, @RequestParam("ord_cnt") int ord_cnt, 
				Model model,HttpSession httpsession) {
			V1_Order vo = new V1_Order();
			String mem_id=(String)httpsession.getAttribute("SID");
			
			vo.setItm_no(itm_no);
			vo.setMem_id(mem_id);
			vo.setOrd_cnt(ord_cnt);
			
			oDAO.OrderInsert(vo);
			
			model.addAttribute("vo", vo);
			
			model.addAttribute("msg", "주문되었습니다.");
			model.addAttribute("url", "mypage.do");
			return "alert";

		}
	
		//배송하기
		@RequestMapping(value="delivery.do", method=RequestMethod.GET)
		public String delivery(@RequestParam("ord_no") int ord_no, Model model) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("dvr_status", 0);
			map.put("ord_no", ord_no);

			dDAO.insertDeliveryOne(map);

			return "redirect:admin.do?menu=4";//관리자의 배송관리페이지로 이동

		}
	
	//이미지
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
