package com.ds.sts1.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Order;

@Service
public class OrderImpl implements OrderDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession = null;

	//주문하기
	@Override
	public int OrderInsert(V1_Order vo) {
		return sqlSession.insert("V1_Order.OrderInsert",vo);
	}
	
	
	//주문보기(관리자)
	@Override
	public List<HashMap<String, Object>> selectMemberItemOrderList() {
		return sqlSession.selectList("V1_Order.selectMemberItemOrderList");
	}

	
}
