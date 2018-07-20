package com.ds.sts1.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ds.sts1.vo.V1_Order;

public interface OrderDAO {

	public int OrderInsert(V1_Order vo); //주문저장
	public List<HashMap<String, Object>> selectMemberItemOrderList(); //주문보기(관리자)

	}
