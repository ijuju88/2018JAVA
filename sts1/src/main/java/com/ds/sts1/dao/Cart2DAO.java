package com.ds.sts1.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import com.ds.sts1.vo.V1_Cart2;

public interface Cart2DAO {
	
	@Select({"SELECT * FROM V1_CATEGORIZE2 WHERE CATE_NO=#{CATE_NO}"})
	public List<V1_Cart2> selectCate2List(int no); //항목소분류
}

