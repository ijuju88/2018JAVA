package com.ds.sts1.dao;

import java.util.List;

import com.ds.sts1.vo.V1_Cart;

public interface CartDAO {
	public int CartInsert(V1_Cart vo);//장바구니추가
	public List<V1_Cart> selectItemList(String id); //장바구니 리스트
}
