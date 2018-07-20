package com.ds.sts1.dao;

import java.util.Map;

public interface DeliveryDAO {

	public int insertDeliveryOne(Map<String, Object> map); //배송하기
	public int selectOrderNoCheck(int ord_no); //배송하기 눌렸는지 확인
	}
