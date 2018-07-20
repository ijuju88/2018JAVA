package com.ds.sts1.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Board;

@Service
public class DeliveryImpl implements DeliveryDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession = null;

	//배송하기
	@Override
	public int insertDeliveryOne(Map<String, Object> map) {
		return sqlSession.insert("V1_Delivery.insertDeliveryOne", map);
	}

	//배송하기 확인
	@Override
	public int selectOrderNoCheck(int ord_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Delivery.selectOrderNoCheck", ord_no);
	}

	
}
