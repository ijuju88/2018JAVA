package com.ds.sts1;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ds.sts1.dao.ItemDAO;
import com.ds.sts1.vo.V1_Item;

@RestController
public class AjaxController {

	//DAO호출
	@Autowired
	private ItemDAO iDAO=null;

	//Map{"abc":"def"}
	//VO {itm_no":14,"....} 에러제어 {"ret":"n"}
	//List<vo> {} {} {}
	@RequestMapping(value="ajax_item_one.do", 
			method={RequestMethod.GET, RequestMethod.POST}
	,produces="application/json")
	public Map<String, Object> ajaxitemOne(){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("abc", "def");

		return map;
	}


	//물품한개수정 
	@RequestMapping(value="admin_ajax_item_one.do", 
			method={RequestMethod.GET, RequestMethod.POST}
		,produces="application/json")
	public Map<String, Object> edititem
	(HttpServletRequest request, HttpServletResponse response,@RequestParam("itm_no") int no) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			V1_Item vo=iDAO.selectEditItemOne(no);
			map.put("ret", vo);
			System.out.println("수정제목 : "+vo.getItm_no());

			return map;

		} catch (Exception e) {
			map.put("ret", "n");
			System.out.println("회원수정 컨트롤러 에러 : "+e.getMessage());
			return map;
		}


	}
}
