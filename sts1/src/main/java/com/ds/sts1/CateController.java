package com.ds.sts1;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ds.sts1.dao.Cart1DAO;
import com.ds.sts1.dao.Cart2DAO;
import com.ds.sts1.vo.V1_Cart1;
import com.ds.sts1.vo.V1_Cart2;

@RestController
@MapperScan({"com.ds.sts1.dao"})
public class CateController {


	@Autowired
	private Cart1DAO c1DAO=null;
	
	@Autowired
	private Cart2DAO c2DAO=null;
	
	//대분류
	@RequestMapping(value="ajax_get_cate1.do", 
			method={RequestMethod.GET, RequestMethod.POST}
	,produces="application/json")
	public List<V1_Cart1> ajaxGetCate1(@RequestParam("itm_no") int itm_no){
		List<V1_Cart1> list1=c1DAO.selectCate1List(itm_no);

		return list1;
	}
	
	
	//소분류
		@RequestMapping(value="ajax_get_cate2.do", 
				method={RequestMethod.GET, RequestMethod.POST}
		,produces="application/json")
		public List<V1_Cart2> ajaxGetCate2(@RequestParam("cate_no") int cate_no){
			List<V1_Cart2> list2=c2DAO.selectCate2List(cate_no);
			

			return list2;
		}
}
