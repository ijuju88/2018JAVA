package com.ds.sts1.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ds.sts1.vo.V1_Cart1;

public interface Cart1DAO {
	
	@Select({"SELECT * FROM V1_CATEGORIZE1 WHERE ITM_NO=#{ITM_NO}"})
	public List<V1_Cart1> selectCate1List(int no); //항목대분류
}

