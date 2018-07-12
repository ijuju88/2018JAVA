package com.ds.sts1.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Cart;

@Service
public class CartImpl implements CartDAO{

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession = null;

	//장바구니추가
	@Override
	public int CartInsert(V1_Cart vo) {
		return sqlSession.insert("V1_Cart.insertcart",vo);
	}

	//장바구니보기
	@Override
	public List<V1_Cart> selectItemList(String id) {
		System.out.println("id"+id);
		return sqlSession.selectList("V1_Cart.selectcartlist", id);
	}

	

}
