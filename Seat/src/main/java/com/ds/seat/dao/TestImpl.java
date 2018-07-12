package com.ds.seat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.seat.vo.V1_Test;

@Service
public class TestImpl implements TestDAO{
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession=null;
	
	@Override
	public List<V1_Test> TestSelectList() {
		return sqlSession.selectList("v1_test.selectTest");
	}

	
}
